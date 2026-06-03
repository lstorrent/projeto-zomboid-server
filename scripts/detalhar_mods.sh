#!/bin/bash
# ============================================================
# detalhar_mods.sh - Consulta a Steam Workshop API e extrai
# informações detalhadas de cada mod
#
# API usada: ISteamRemoteStorage/GetPublishedFileDetails/v1
# (Pública, não precisa de API key)
#
# Uso:
#   ./detalhar_mods.sh                        # Lê IDs do servertest.ini
#   ./detalhar_mods.sh /caminho/pasta/108600  # Lê IDs da pasta workshop
#   ./detalhar_mods.sh --ids "ID1;ID2;ID3"    # IDs manuais
#
# Output:
#   --format md    (padrão) Markdown para README
#   --format json  JSON completo
#   --format csv   CSV para planilhas
#
# Exemplos:
#   ./detalhar_mods.sh --format md > mods_detalhados.md
#   ./detalhar_mods.sh /pasta/108600 --format json > mods.json
# ============================================================

set -euo pipefail

# ======================== CONFIG ========================
STEAM_API_URL="https://api.steampowered.com/ISteamRemoteStorage/GetPublishedFileDetails/v1/"
BATCH_SIZE=50          # IDs por request (Steam aceita ~100, usamos 50 por segurança)
SLEEP_BETWEEN=1        # Segundos entre requests para não levar rate-limit
SERVERTEST_PATH="../configs/servertest.ini"
OUTPUT_FORMAT="md"

# Detectar Python (py no Windows, python3 no Linux/Mac)
if command -v py &>/dev/null; then
    PYTHON_CMD="py"
elif command -v python3 &>/dev/null; then
    PYTHON_CMD="python3"
elif command -v python &>/dev/null; then
    PYTHON_CMD="python"
else
    echo "ERRO: Python não encontrado. Instale Python 3." >&2
    exit 1
fi
# ========================================================

# Cores para terminal
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# ======================== FUNÇÕES ========================

mostrar_uso() {
    echo "=== Detalhador de Mods - Steam Workshop API ==="
    echo ""
    echo "Uso:"
    echo "  ./detalhar_mods.sh                              # Lê IDs do servertest.ini"
    echo "  ./detalhar_mods.sh /caminho/pasta/108600        # Lê IDs da pasta workshop"
    echo "  ./detalhar_mods.sh --ids \"ID1;ID2;ID3\"          # IDs manuais"
    echo ""
    echo "Opções:"
    echo "  --format md|json|csv   Formato de saída (padrão: md)"
    echo "  --output arquivo       Salvar em arquivo"
    echo "  --help                 Mostrar esta ajuda"
    echo ""
    echo "Exemplos:"
    echo "  ./detalhar_mods.sh --format md > mods_detalhados.md"
    echo "  ./detalhar_mods.sh --ids \"2200148440;639909479\" --format json"
}

# Limpa BBCode da Steam para texto puro
limpar_bbcode() {
    local texto="$1"
    echo "$texto" | sed \
        -e 's/\[h1\]//g' -e 's/\[\/h1\]//g' \
        -e 's/\[h2\]//g' -e 's/\[\/h2\]//g' \
        -e 's/\[h3\]//g' -e 's/\[\/h3\]//g' \
        -e 's/\[b\]//g' -e 's/\[\/b\]//g' \
        -e 's/\[i\]//g' -e 's/\[\/i\]//g' \
        -e 's/\[u\]//g' -e 's/\[\/u\]//g' \
        -e 's/\[url=[^]]*\]//g' -e 's/\[\/url\]//g' \
        -e 's/\[URL=[^]]*\]//g' -e 's/\[\/URL\]//g' \
        -e 's/\[img\][^[]*\[\/img\]//g' \
        -e 's/\[list\]//g' -e 's/\[\/list\]//g' \
        -e 's/\[\*\]/• /g' \
        -e 's/\[code\]//g' -e 's/\[\/code\]//g' \
        -e 's/\[strike\]//g' -e 's/\[\/strike\]//g' \
        -e 's/\[spoiler\]//g' -e 's/\[\/spoiler\]//g' \
        -e 's/\[noparse\]//g' -e 's/\[\/noparse\]//g' \
        -e 's/\[table\]//g' -e 's/\[\/table\]//g' \
        -e 's/\[tr\]//g' -e 's/\[\/tr\]//g' \
        -e 's/\[td\]//g' -e 's/\[\/td\]//g' \
        -e 's/\[th\]//g' -e 's/\[\/th\]//g' \
        -e 's/\\r\\n/ /g' \
        -e 's/\\n/ /g' \
        -e 's/  */ /g' \
        | head -c 500
}

# Extrai IDs do servertest.ini
extrair_ids_servertest() {
    local arquivo="$1"
    grep -oP '^WorkshopItems=\K.*' "$arquivo" | tr ';' '\n' | sort -n | uniq
}

# Extrai IDs de uma pasta (nomes das subpastas numéricas)
extrair_ids_pasta() {
    local pasta="$1"
    ls -1 "$pasta" | grep -E '^[0-9]+$' | sort -n
}

# Consulta a Steam API em lote
# Recebe: array de IDs
# Retorna: JSON com detalhes
consultar_api_lote() {
    local ids=("$@")
    local count=${#ids[@]}
    local data="itemcount=${count}"

    for i in "${!ids[@]}"; do
        data+="&publishedfileids[${i}]=${ids[$i]}"
    done

    curl -s -X POST "$STEAM_API_URL" -d "$data"
}

# Processa o JSON de resposta e formata output
processar_resposta_md() {
    local json="$1"

    # Usa jq se disponível, senão python
    if command -v jq &>/dev/null; then
        echo "$json" | jq -r '
            .response.publishedfiledetails[] |
            select(.result == 1) |
            "| \(.publishedfileid) | \(.title // "N/A") | \(.subscriptions // 0) | \(.tags // [] | map(.tag) | join(", ")) | \(.time_updated // 0 | todate) |"
        ' 2>/dev/null
    else
        echo "$json" | ${PYTHON_CMD} -c "
import json, sys, datetime
data = json.load(sys.stdin)
for item in data['response']['publishedfiledetails']:
    if item.get('result') != 1:
        continue
    wid = item['publishedfileid']
    title = item.get('title', 'N/A')
    subs = item.get('subscriptions', 0)
    tags = ', '.join([t['tag'] for t in item.get('tags', [])])
    updated = datetime.datetime.fromtimestamp(item.get('time_updated', 0)).strftime('%Y-%m-%d')
    desc = item.get('description', '')[:300].replace('\n', ' ').replace('\r', ' ').replace('|', '-')
    print(f'| {wid} | {title} | {subs:,} | {tags} | {updated} |')
" 2>/dev/null
    fi
}

processar_resposta_json() {
    local json="$1"

    if command -v jq &>/dev/null; then
        echo "$json" | jq '
            .response.publishedfiledetails[] |
            select(.result == 1) |
            {
                workshop_id: .publishedfileid,
                title: .title,
                description: (.description // "" | gsub("\\[[^\\]]*\\]"; "") | .[0:500]),
                subscriptions: .subscriptions,
                favorited: .favorited,
                tags: [.tags[]?.tag],
                file_size_mb: ((.file_size | tonumber) / 1048576 | floor),
                created: (.time_created | todate),
                updated: (.time_updated | todate),
                preview_url: .preview_url,
                link: "https://steamcommunity.com/sharedfiles/filedetails/?id=\(.publishedfileid)"
            }
        ' 2>/dev/null
    else
        echo "$json" | ${PYTHON_CMD} -c "
import json, sys, datetime, re
data = json.load(sys.stdin)
results = []
for item in data['response']['publishedfiledetails']:
    if item.get('result') != 1:
        continue
    desc = re.sub(r'\[[^\]]*\]', '', item.get('description', ''))[:500]
    results.append({
        'workshop_id': item['publishedfileid'],
        'title': item.get('title', 'N/A'),
        'description': desc,
        'subscriptions': item.get('subscriptions', 0),
        'favorited': item.get('favorited', 0),
        'tags': [t['tag'] for t in item.get('tags', [])],
        'file_size_mb': int(int(item.get('file_size', 0)) / 1048576),
        'created': datetime.datetime.fromtimestamp(item.get('time_created', 0)).isoformat(),
        'updated': datetime.datetime.fromtimestamp(item.get('time_updated', 0)).isoformat(),
        'preview_url': item.get('preview_url', ''),
        'link': f\"https://steamcommunity.com/sharedfiles/filedetails/?id={item['publishedfileid']}\"
    })
print(json.dumps(results, indent=2, ensure_ascii=False))
" 2>/dev/null
    fi
}

processar_resposta_csv() {
    local json="$1"

    ${PYTHON_CMD} -c "
import json, sys, datetime, re
data = json.load(sys.stdin)
for item in data['response']['publishedfiledetails']:
    if item.get('result') != 1:
        continue
    wid = item['publishedfileid']
    title = item.get('title', 'N/A').replace(',', ' ')
    subs = item.get('subscriptions', 0)
    tags = ' | '.join([t['tag'] for t in item.get('tags', [])])
    updated = datetime.datetime.fromtimestamp(item.get('time_updated', 0)).strftime('%Y-%m-%d')
    desc = re.sub(r'\[[^\]]*\]', '', item.get('description', ''))[:200].replace(',', ' ').replace('\n', ' ').replace('\r', ' ')
    print(f'{wid},{title},{subs},{tags},{updated},{desc}')
" <<< "$json" 2>/dev/null
}

# ======================== MAIN ========================

# Parse de argumentos
IDS_SOURCE=""
IDS_MANUAIS=""
OUTPUT_FILE=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        --format)
            OUTPUT_FORMAT="$2"
            shift 2
            ;;
        --output)
            OUTPUT_FILE="$2"
            shift 2
            ;;
        --ids)
            IDS_MANUAIS="$2"
            shift 2
            ;;
        --help|-h)
            mostrar_uso
            exit 0
            ;;
        *)
            IDS_SOURCE="$1"
            shift
            ;;
    esac
done

# Coletar IDs
declare -a ALL_IDS

if [[ -n "$IDS_MANUAIS" ]]; then
    # IDs passados diretamente
    IFS=';' read -ra ALL_IDS <<< "$IDS_MANUAIS"
    echo -e "${BLUE}[INFO]${NC} Usando ${#ALL_IDS[@]} IDs manuais" >&2
elif [[ -n "$IDS_SOURCE" && -d "$IDS_SOURCE" ]]; then
    # Pasta com Workshop IDs
    mapfile -t ALL_IDS < <(extrair_ids_pasta "$IDS_SOURCE")
    echo -e "${BLUE}[INFO]${NC} Encontrados ${#ALL_IDS[@]} IDs na pasta: $IDS_SOURCE" >&2
elif [[ -n "$IDS_SOURCE" && -f "$IDS_SOURCE" ]]; then
    # Arquivo servertest.ini
    mapfile -t ALL_IDS < <(extrair_ids_servertest "$IDS_SOURCE")
    echo -e "${BLUE}[INFO]${NC} Encontrados ${#ALL_IDS[@]} IDs em: $IDS_SOURCE" >&2
elif [[ -f "$SERVERTEST_PATH" ]]; then
    # Padrão: servertest.ini no caminho relativo
    mapfile -t ALL_IDS < <(extrair_ids_servertest "$SERVERTEST_PATH")
    echo -e "${BLUE}[INFO]${NC} Encontrados ${#ALL_IDS[@]} IDs em: $SERVERTEST_PATH" >&2
else
    echo -e "${RED}[ERRO]${NC} Nenhuma fonte de IDs encontrada." >&2
    echo "Use: ./detalhar_mods.sh --help" >&2
    exit 1
fi

if [[ ${#ALL_IDS[@]} -eq 0 ]]; then
    echo -e "${RED}[ERRO]${NC} Nenhum Workshop ID encontrado." >&2
    exit 1
fi

# Header baseado no formato
case "$OUTPUT_FORMAT" in
    md)
        echo "# 🎮 Mods do Servidor - Detalhamento Steam Workshop"
        echo ""
        echo "| Workshop ID | Nome | Assinantes | Tags | Atualizado |"
        echo "|-------------|------|------------|------|------------|"
        ;;
    csv)
        echo "workshop_id,title,subscriptions,tags,updated,description"
        ;;
    json)
        echo "["
        ;;
esac

# Processar em lotes
TOTAL=${#ALL_IDS[@]}
PROCESSADOS=0
PRIMEIRO_JSON=true

for ((i=0; i<TOTAL; i+=BATCH_SIZE)); do
    # Pegar lote atual
    LOTE=("${ALL_IDS[@]:i:BATCH_SIZE}")
    LOTE_SIZE=${#LOTE[@]}
    PROCESSADOS=$((PROCESSADOS + LOTE_SIZE))

    echo -e "${YELLOW}[${PROCESSADOS}/${TOTAL}]${NC} Consultando lote de ${LOTE_SIZE} mods..." >&2

    # Consultar API
    RESPOSTA=$(consultar_api_lote "${LOTE[@]}")

    if [[ -z "$RESPOSTA" ]]; then
        echo -e "${RED}[ERRO]${NC} Falha na consulta do lote ${i}-$((i+LOTE_SIZE))" >&2
        continue
    fi

    # Verificar se a resposta é válida
    if ! echo "$RESPOSTA" | ${PYTHON_CMD} -c "import json,sys; json.load(sys.stdin)" 2>/dev/null; then
        echo -e "${RED}[ERRO]${NC} Resposta inválida da API" >&2
        continue
    fi

    # Processar resposta
    case "$OUTPUT_FORMAT" in
        md)
            processar_resposta_md "$RESPOSTA"
            ;;
        json)
            if [[ "$PRIMEIRO_JSON" == true ]]; then
                PRIMEIRO_JSON=false
            else
                echo ","
            fi
            processar_resposta_json "$RESPOSTA"
            ;;
        csv)
            processar_resposta_csv "$RESPOSTA"
            ;;
    esac

    # Sleep entre lotes (respeitar rate limit)
    if [[ $PROCESSADOS -lt $TOTAL ]]; then
        sleep $SLEEP_BETWEEN
    fi
done

# Footer
case "$OUTPUT_FORMAT" in
    json)
        echo "]"
        ;;
esac

echo "" >&2
echo -e "${GREEN}[DONE]${NC} ${PROCESSADOS} mods processados com sucesso!" >&2
