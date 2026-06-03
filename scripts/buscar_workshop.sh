#!/bin/bash
# ============================================================
# buscar_workshop.sh - Busca mods na Steam Workshop
#
# Usa a Steam Store API para buscar mods por nome e retornar
# informações detalhadas usando GetPublishedFileDetails.
#
# Uso:
#   ./buscar_workshop.sh "Nome do Mod"     # Busca por nome
#   ./buscar_workshop.sh --id 2200148440   # Detalhes de um ID específico
#   ./buscar_workshop.sh mods.txt          # Busca lista (um por linha)
#
# Exemplos:
#   ./buscar_workshop.sh "Brita's Weapon Pack"
#   ./buscar_workshop.sh --id 2200148440
#   ./buscar_workshop.sh --id "2200148440;639909479"
# ============================================================

set -euo pipefail

STEAM_API_URL="https://api.steampowered.com/ISteamRemoteStorage/GetPublishedFileDetails/v1/"
SEARCH_URL="https://steamcommunity.com/workshop/browse/?appid=108600&searchtext=QUERY&browsesort=textsearch&section=readytouseitems"

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

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# Busca detalhes de um ID via API
detalhar_id() {
    local id="$1"

    local resposta=$(curl -s -X POST "$STEAM_API_URL" -d "itemcount=1&publishedfileids[0]=${id}")

    ${PYTHON_CMD} -c "
import json, sys, datetime, re

data = json.load(sys.stdin)
items = data.get('response', {}).get('publishedfiledetails', [])

if not items or items[0].get('result') != 1:
    print('  ❌ ID não encontrado ou removido')
    sys.exit(0)

item = items[0]
title = item.get('title', 'N/A')
desc_raw = item.get('description', '')
# Limpar BBCode
desc = re.sub(r'\[[^\]]*\]', '', desc_raw)
desc = re.sub(r'\s+', ' ', desc).strip()[:400]
subs = item.get('subscriptions', 0)
favs = item.get('favorited', 0)
size_mb = int(item.get('file_size', 0)) / 1048576
tags = [t['tag'] for t in item.get('tags', [])]
created = datetime.datetime.fromtimestamp(item.get('time_created', 0)).strftime('%Y-%m-%d')
updated = datetime.datetime.fromtimestamp(item.get('time_updated', 0)).strftime('%Y-%m-%d')
banned = item.get('banned', 0)

print(f'  📦 Título:      {title}')
print(f'  🆔 Workshop ID: {item[\"publishedfileid\"]}')
print(f'  🔗 Link:        https://steamcommunity.com/sharedfiles/filedetails/?id={item[\"publishedfileid\"]}')
print(f'  📊 Assinantes:  {subs:,}')
print(f'  ⭐ Favoritos:   {favs:,}')
print(f'  💾 Tamanho:     {size_mb:.1f} MB')
print(f'  🏷️  Tags:        {', '.join(tags)}')
print(f'  📅 Criado:      {created}')
print(f'  🔄 Atualizado:  {updated}')
if banned:
    print(f'  ⛔ STATUS:      BANIDO')
print(f'  📝 Descrição:   {desc[:300]}...' if len(desc) > 300 else f'  📝 Descrição:   {desc}')
" <<< "$resposta"
}

# Busca por nome usando scraping + detalhamento via API
buscar_por_nome() {
    local termo="$1"
    local busca=$(echo "$termo" | sed 's/ /+/g')
    local url="${SEARCH_URL//QUERY/$busca}"

    echo -e "  ${YELLOW}Buscando na Workshop...${NC}"

    # Pega página de busca
    local pagina=$(curl -s --compressed "$url")

    # Extrai IDs dos resultados
    local ids=$(echo "$pagina" | grep -oP 'filedetails/\?id=\K[0-9]+' | awk '!seen[$0]++' | head -5)

    if [[ -z "$ids" ]]; then
        echo -e "  ${RED}❌ Nenhum resultado encontrado${NC}"
        return
    fi

    # Mostra os primeiros resultados com detalhes via API
    local count=0
    while IFS= read -r id; do
        count=$((count + 1))
        echo ""
        echo -e "  ${CYAN}--- Resultado #${count} ---${NC}"
        detalhar_id "$id"

        if [[ $count -ge 3 ]]; then
            break
        fi
        sleep 1
    done <<< "$ids"
}

# ======================== MAIN ========================

if [[ $# -eq 0 ]]; then
    echo -e "${BLUE}=== Buscador de Mods - Steam Workshop ===${NC}"
    echo ""
    echo "Uso:"
    echo "  ./buscar_workshop.sh \"Nome do Mod\"     # Busca por nome"
    echo "  ./buscar_workshop.sh --id 2200148440   # Detalhes de um ID"
    echo "  ./buscar_workshop.sh --id \"ID1;ID2\"    # Detalhes de vários IDs"
    echo "  ./buscar_workshop.sh mods.txt          # Busca lista do arquivo"
    exit 0
fi

# Modo --id: detalhar IDs específicos
if [[ "$1" == "--id" ]]; then
    shift
    IFS=';' read -ra IDS <<< "$1"
    for id in "${IDS[@]}"; do
        echo -e "${GREEN}[ID: ${id}]${NC}"
        detalhar_id "$id"
        echo ""
    done
    exit 0
fi

# Modo arquivo: buscar lista
if [[ -f "$1" ]]; then
    while IFS= read -r mod; do
        [[ -z "$mod" ]] && continue
        echo -e "${GREEN}[${mod}]${NC}"
        buscar_por_nome "$mod"
        echo ""
        sleep 3
    done < "$1"
    exit 0
fi

# Modo padrão: buscar por nome
echo -e "${GREEN}[$1]${NC}"
buscar_por_nome "$1"
