#!/bin/bash
# ============================================================
# validar_ids.sh - Valida Workshop IDs usando a Steam API
#
# Verifica se cada ID existe, está acessível e retorna info básica.
# Muito mais confiável que scraping HTML.
#
# API: ISteamRemoteStorage/GetPublishedFileDetails/v1 (pública)
#
# Uso:
#   ./validar_ids.sh                         # Valida IDs do servertest.ini
#   ./validar_ids.sh /caminho/pasta/108600   # Valida IDs da pasta
#   ./validar_ids.sh --ids "ID1;ID2;ID3"     # IDs manuais
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

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Parse argumentos
IDS_SOURCE=""
IDS_MANUAIS=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        --ids) IDS_MANUAIS="$2"; shift 2 ;;
        --help|-h)
            echo "Uso: ./validar_ids.sh [pasta|arquivo|--ids \"ID1;ID2\"]"
            exit 0 ;;
        *) IDS_SOURCE="$1"; shift ;;
    esac
done

# Coletar IDs
declare -a ALL_IDS

if [[ -n "$IDS_MANUAIS" ]]; then
    IFS=';' read -ra ALL_IDS <<< "$IDS_MANUAIS"
elif [[ -n "$IDS_SOURCE" && -d "$IDS_SOURCE" ]]; then
    mapfile -t ALL_IDS < <(ls -1 "$IDS_SOURCE" | grep -E '^[0-9]+$' | sort -n)
elif [[ -n "$IDS_SOURCE" && -f "$IDS_SOURCE" ]]; then
    mapfile -t ALL_IDS < <(grep -oP '^WorkshopItems=\K.*' "$IDS_SOURCE" | tr ';' '\n' | sort -n | uniq)
elif [[ -f "$SERVERTEST_PATH" ]]; then
    mapfile -t ALL_IDS < <(grep -oP '^WorkshopItems=\K.*' "$SERVERTEST_PATH" | tr ';' '\n' | sort -n | uniq)
else
    echo -e "${RED}[ERRO]${NC} Nenhuma fonte de IDs encontrada."
    exit 1
fi

TOTAL=${#ALL_IDS[@]}
echo -e "${BLUE}=== Validação de ${TOTAL} Workshop IDs ===${NC}"
echo ""

VALIDOS=0
INVALIDOS=0
REMOVIDOS=0

# Processar em lotes
for ((i=0; i<TOTAL; i+=BATCH_SIZE)); do
    LOTE=("${ALL_IDS[@]:i:BATCH_SIZE}")
    COUNT=${#LOTE[@]}

    # Montar body do POST
    DATA="itemcount=${COUNT}"
    for j in "${!LOTE[@]}"; do
        DATA+="&publishedfileids[${j}]=${LOTE[$j]}"
    done

    # Consultar API
    RESPOSTA=$(curl -s -X POST "$STEAM_API_URL" -d "$DATA")

    # Processar cada resultado
    echo "$RESPOSTA" | ${PYTHON_CMD} -c "
import json, sys, datetime

data = json.load(sys.stdin)
for item in data['response']['publishedfiledetails']:
    wid = item['publishedfileid']
    result = item.get('result', 0)

    if result == 1:
        title = item.get('title', 'Sem título')
        subs = item.get('subscriptions', 0)
        banned = item.get('banned', 0)
        updated = datetime.datetime.fromtimestamp(item.get('time_updated', 0)).strftime('%Y-%m-%d')
        tags = ', '.join([t['tag'] for t in item.get('tags', [])])

        if banned:
            print(f'⛔ BANIDO  | {wid} | {title}')
        else:
            print(f'✅ OK      | {wid} | {title} | {subs:,} subs | {tags} | Atualizado: {updated}')
    elif result == 9:
        print(f'❌ REMOVIDO| {wid} | Item foi removido da Workshop')
    else:
        print(f'⚠️  ERRO    | {wid} | Resultado desconhecido (code: {result})')
"

    # Rate limit
    if [[ $((i + BATCH_SIZE)) -lt $TOTAL ]]; then
        sleep 1
    fi
done

echo ""
echo -e "${BLUE}=== Validação completa ===${NC}"
echo -e "Total verificados: ${TOTAL}"
