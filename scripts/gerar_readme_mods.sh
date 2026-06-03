#!/bin/bash
# ============================================================
# gerar_readme_mods.sh - Gera documentação Markdown dos mods
# automaticamente consultando a Steam Workshop API
#
# Lê os Workshop IDs do servertest.ini ou pasta local,
# consulta a API, e gera tabelas Markdown prontas para o README.
#
# Uso:
#   ./gerar_readme_mods.sh                        # Usa servertest.ini
#   ./gerar_readme_mods.sh /caminho/pasta/108600  # Usa pasta
#   ./gerar_readme_mods.sh > ../MODS.md           # Salva em arquivo
# ============================================================

set -euo pipefail

STEAM_API_URL="https://api.steampowered.com/ISteamRemoteStorage/GetPublishedFileDetails/v1/"
BATCH_SIZE=50
SERVERTEST_PATH="../configs/servertest.ini"

# Detectar Python
if command -v py &>/dev/null; then
    PYTHON_CMD="py"
elif command -v python3 &>/dev/null; then
    PYTHON_CMD="python3"
elif command -v python &>/dev/null; then
    PYTHON_CMD="python"
else
    echo "ERRO: Python não encontrado." >&2
    exit 1
fi

# Cores (só para stderr)
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Arquivo temporário para acumular JSON
TMPFILE=$(mktemp)
trap "rm -f $TMPFILE" EXIT
echo "[]" > "$TMPFILE"

# ======================== COLETAR IDs ========================

IDS_SOURCE="${1:-}"
declare -a ALL_IDS

if [[ -n "$IDS_SOURCE" && -d "$IDS_SOURCE" ]]; then
    mapfile -t ALL_IDS < <(ls -1 "$IDS_SOURCE" | grep -E '^[0-9]+$' | sort -n)
    echo -e "${BLUE}[INFO]${NC} ${#ALL_IDS[@]} IDs da pasta: $IDS_SOURCE" >&2
elif [[ -n "$IDS_SOURCE" && -f "$IDS_SOURCE" ]]; then
    mapfile -t ALL_IDS < <(grep -oP '^WorkshopItems=\K.*' "$IDS_SOURCE" | tr ';' '\n' | sort -n | uniq)
    echo -e "${BLUE}[INFO]${NC} ${#ALL_IDS[@]} IDs de: $IDS_SOURCE" >&2
elif [[ -f "$SERVERTEST_PATH" ]]; then
    mapfile -t ALL_IDS < <(grep -oP '^WorkshopItems=\K.*' "$SERVERTEST_PATH" | tr ';' '\n' | sort -n | uniq)
    echo -e "${BLUE}[INFO]${NC} ${#ALL_IDS[@]} IDs de: $SERVERTEST_PATH" >&2
else
    echo "ERRO: Nenhuma fonte de IDs" >&2
    exit 1
fi

# ======================== CONSULTAR API ========================

echo -e "${YELLOW}[...]${NC} Consultando Steam API..." >&2

for ((i=0; i<${#ALL_IDS[@]}; i+=BATCH_SIZE)); do
    LOTE=("${ALL_IDS[@]:i:BATCH_SIZE}")
    DATA="itemcount=${#LOTE[@]}"
    for j in "${!LOTE[@]}"; do
        DATA+="&publishedfileids[${j}]=${LOTE[$j]}"
    done

    RESP=$(curl -s -X POST "$STEAM_API_URL" -d "$DATA")

    # Merge JSON usando arquivo temporário via stdin
    ${PYTHON_CMD} -c "
import json, sys

with open(sys.argv[1], 'r') as f:
    existing = json.load(f)

new_data = json.loads(sys.stdin.read())
items = new_data.get('response', {}).get('publishedfiledetails', [])
existing.extend([i for i in items if i.get('result') == 1])

with open(sys.argv[1], 'w') as f:
    json.dump(existing, f)
" "$TMPFILE" <<< "$RESP"

    echo -e "${YELLOW}[$((i + ${#LOTE[@]}))/${#ALL_IDS[@]}]${NC} Processando..." >&2

    if [[ $((i + BATCH_SIZE)) -lt ${#ALL_IDS[@]} ]]; then
        sleep 1
    fi
done

# ======================== GERAR MARKDOWN ========================

echo -e "${GREEN}[OK]${NC} Gerando Markdown..." >&2

${PYTHON_CMD} - "$TMPFILE" << 'PYTHON_SCRIPT'
import json, sys, datetime, re

with open(sys.argv[1], 'r') as f:
    data = json.load(f)

# Categorizar por tags
categories = {
    'Weapons': {'emoji': '🔫', 'name': 'Armas e Combate', 'items': []},
    'Vehicles': {'emoji': '🚗', 'name': 'Veículos', 'items': []},
    'Buildings': {'emoji': '🏗️', 'name': 'Construção e Base', 'items': []},
    'Clothing': {'emoji': '👕', 'name': 'Roupas e Equipamento', 'items': []},
    'Interface': {'emoji': '🛠️', 'name': 'QoL e Interface', 'items': []},
    'Gameplay': {'emoji': '🎮', 'name': 'Gameplay e Imersão', 'items': []},
    'Framework': {'emoji': '🔧', 'name': 'APIs e Dependências', 'items': []},
    'Maps': {'emoji': '🗺️', 'name': 'Mapas e Spawns', 'items': []},
    'Translations': {'emoji': '🌐', 'name': 'Traduções', 'items': []},
}

def categorize(item):
    tags = [t['tag'].lower() for t in item.get('tags', [])]
    title = item.get('title', '').lower()
    desc = item.get('description', '').lower()

    if any(w in title for w in ['tradução', 'traducao', 'ptbr', 'translation']):
        return 'Translations'
    if any(w in title or w in desc for w in ['weapon', 'gun', 'firearm', 'ammo', 'rifle', 'pistol', 'sling', 'silencer', 'armor', 'holster']):
        return 'Weapons'
    if any(w in title or w in desc for w in ['vehicle', 'car', 'truck', 'bike', 'bus', 'trailer', 'motor', 'ford', 'jeep', 'bmw', 'porsche', 'chevrolet', 'shelby', 'kawasaki', 'brough', 'humvee', 'hmmwv', 'bicycle', 'oshkosh', 'commando', 'lav', 'cadillac gage', 'land cruiser', 'ranger']):
        return 'Vehicles'
    if 'framework' in tags or any(w in title.lower() for w in ['library', 'api', 'lib', 'cache']):
        return 'Framework'
    if any(w in title or w in desc for w in ['build', 'construct', 'solar', 'debris']):
        return 'Buildings'
    if any(w in title or w in desc for w in ['cloth', 'hair', 'poncho', 'uniform', 'vision', 'ushanka', 'alice pack', 'alice gear', 'backpack', 'nvg', 'night vision', 'dpm']):
        return 'Clothing'
    if any(w in title or w in desc for w in ['map', 'spawn', 'louisville spawn']):
        return 'Maps'
    if any(w in title or w in desc for w in ['hotbar', 'display bar', 'inventory', 'read', 'config', 'ui api', 'fps', 'hud', 'lighter', 'key', 'hotwir', 'door', 'window', 'error', 'alert']):
        return 'Interface'
    return 'Gameplay'

def clean_desc(desc):
    # Remove BBCode
    desc = re.sub(r'\[[^\]]*\]', '', desc)
    desc = re.sub(r'https?://\S+', '', desc)
    desc = re.sub(r'\r\n|\r|\n', ' ', desc)
    desc = re.sub(r'\s+', ' ', desc).strip()
    # Pega primeiras frases úteis
    sentences = re.split(r'[.!?\n]', desc)
    result = ''
    for s in sentences:
        s = s.strip()
        if len(s) > 15 and not any(skip in s.lower() for skip in ['discord', 'patreon', 'copyright', 'permission', 'ko-fi', 'donate', 'paypal', 'not compatible', 'attention', 'be advised', 'no permission']):
            if result:
                result += '. ' + s
            else:
                result = s
            if len(result) > 150:
                break
    if not result:
        result = desc[:200]
    return (result[:250] + '...') if len(result) > 250 else result

# Categorizar todos os mods
for item in data:
    cat = categorize(item)
    categories[cat]['items'].append(item)

# Gerar output
print('## 🎮 Mods Instalados ({} Workshop Items)'.format(len(data)))
print()

total_subs = sum(item.get('subscriptions', 0) for item in data)
print('> **{}** mods | **{:,}** assinantes combinados na Workshop'.format(len(data), total_subs))
print()

for cat_key, cat in categories.items():
    if not cat['items']:
        continue

    print('### {} {}'.format(cat['emoji'], cat['name']))
    print()
    print('| Workshop ID | Nome | Assinantes | Descrição |')
    print('|-------------|------|------------|-----------|')

    for item in sorted(cat['items'], key=lambda x: x.get('subscriptions', 0), reverse=True):
        wid = item['publishedfileid']
        title = item.get('title', 'N/A').replace('|', '-')
        subs = item.get('subscriptions', 0)
        desc = clean_desc(item.get('description', '')).replace('|', '-').replace('\n', ' ')
        link = 'https://steamcommunity.com/sharedfiles/filedetails/?id={}'.format(wid)

        subs_str = '{:,}'.format(subs)
        print('| [{}]({}) | {} | {} | {} |'.format(wid, link, title, subs_str, desc))

    print()

# Estatísticas
print('---')
print()
print('### 📊 Estatísticas')
print()
print('| Métrica | Valor |')
print('|---------|-------|')
print('| Total de mods | {} |'.format(len(data)))
print('| Assinantes combinados | {:,} |'.format(total_subs))

sizes = [int(item.get('file_size', 0)) for item in data]
total_size = sum(sizes) / (1024*1024*1024)
print('| Tamanho total estimado | {:.1f} GB |'.format(total_size))

dates = [item.get('time_updated', 0) for item in data]
valid_dates = [d for d in dates if d > 0]
if valid_dates:
    oldest = datetime.datetime.fromtimestamp(min(valid_dates)).strftime('%Y-%m-%d')
    newest = datetime.datetime.fromtimestamp(max(valid_dates)).strftime('%Y-%m-%d')
    print('| Mod mais antigo (atualização) | {} |'.format(oldest))
    print('| Mod mais recente (atualização) | {} |'.format(newest))
PYTHON_SCRIPT

echo "" >&2
echo -e "${GREEN}[DONE]${NC} Markdown gerado com sucesso!" >&2
