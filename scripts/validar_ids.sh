#!/bin/bash
# Valida se os IDs existem checando se aparecem na busca da Workshop

ids=(
"2337452747:FortKnoxLinked"
"2384329562:FortKnoxRoad"
"2879745353:RavenCreek"
"2196102849:RV_Interior_MP"
"3392009877:StartasPrisoner"
"3051276857:KYRRealWeatherMod"
"2955282161:HypothermiaKillsHard"
"2971021306:SurvivingTheStorm"
"2920735875:WeatherMoodles"
"2899681016:HardFarming"
"2886456626:HardFishing"
"2909936075:HardTrapping"
"2704811006:snowiswater"
"2760742937:WorkingMasks"
"2890748284:FoodPreservationPlus"
"2687798127:RS_WaterCistern"
"2682587495:DangerMoodlesColdAndFlu"
"2677249185:DangerMoodlesDeadlyInfections"
"2883397918:GeneratorTimeRemaining"
"3259006949:SiphoningNeedsHoses"
"3236152598:TheOnlyCure"
)

for item in "${ids[@]}"; do
    id="${item%%:*}"
    nome="${item##*:}"
    existe=$(curl -s --compressed "https://steamcommunity.com/workshop/browse/?appid=108600&searchtext=${id}&browsesort=textsearch&section=readytouseitems" | grep -c "filedetails/?id=${id}")
    if [ "$existe" -gt 0 ]; then
        echo "OK  - ${nome} (${id})"
    else
        echo "FALHOU - ${nome} (${id})"
    fi
    sleep 2
done
