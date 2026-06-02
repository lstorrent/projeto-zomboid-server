#!/bin/bash
# Busca Workshop IDs de mods do Project Zomboid na Steam Workshop
# Uso:
#   ./buscar_workshop.sh "Nome do Mod"    - busca um mod
#   ./buscar_workshop.sh mods.txt          - busca lista (um por linha)

buscar_mod() {
    local termo="$1"
    local busca=$(echo "$termo" | sed 's/ /+/g')
    local pagina=$(curl -s "https://steamcommunity.com/workshop/browse/?appid=108600&searchtext=${busca}&browsesort=textsearch&section=readytouseitems")
    
    # Pega IDs unicos, ignora o primeiro (featured)
    local ids=$(echo "$pagina" | grep -oP 'filedetails/\?id=\K[0-9]+' | awk '!seen[$0]++' | tail -n +2)
    local primeiro_id=$(echo "$ids" | head -1)
    
    if [ -z "$primeiro_id" ]; then
        echo "  NAO ENCONTRADO"
        return
    fi
    
    # Pega titulo do primeiro resultado
    local titulo=$(curl -s "https://steamcommunity.com/sharedfiles/filedetails/?id=${primeiro_id}" | grep -oP '<title>\K[^<]+' | sed 's/Steam Workshop:://' | xargs)
    
    echo "  ID: ${primeiro_id}"
    echo "  Titulo: ${titulo}"
    echo "  Link: https://steamcommunity.com/sharedfiles/filedetails/?id=${primeiro_id}"
    echo ""
}

# Se passar arquivo .txt, lê lista
if [ -f "$1" ]; then
    while IFS= read -r mod; do
        [ -z "$mod" ] && continue
        echo "[$mod]"
        buscar_mod "$mod"
        sleep 3
    done < "$1"
# Se passar argumento normal, busca um mod
elif [ -n "$1" ]; then
    echo "[$1]"
    buscar_mod "$1"
else
    echo "=== Buscador de Workshop IDs - Project Zomboid ==="
    echo ""
    echo "Uso:"
    echo "  ./buscar_workshop.sh \"Nome do Mod\"    - busca um mod"
    echo "  ./buscar_workshop.sh mods.txt          - busca lista (um por linha no arquivo)"
    echo ""
    echo "Exemplos:"
    echo "  ./buscar_workshop.sh \"KYR Real Weather Mod\""
    echo "  ./buscar_workshop.sh \"Hypothermia Kills Hard\""
fi
