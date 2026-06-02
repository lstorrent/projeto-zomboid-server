# 🧟 Servidor Project Zomboid - Hardcore Survival

> ⚠️ **PROJETO EM FASE ALPHA** — Configurações em desenvolvimento, testes e aceitação da comunidade. O objetivo é criar um servidor o mais próximo possível do **perfeito hardcore survival**.

![Project Zomboid](https://img.shields.io/badge/Project%20Zomboid-v41.78.19-green)
![Mods](https://img.shields.io/badge/Mods-97-blue)
![Players](https://img.shields.io/badge/Max%20Players-32-orange)
![Status](https://img.shields.io/badge/Status-ALPHA-red)

---

## 🚧 Status do Projeto

```
╔══════════════════════════════════════════════════════════╗
║  🔴 ALPHA - Em desenvolvimento e testes                 ║
║                                                          ║
║  • Mods sendo testados e balanceados                     ║
║  • Configurações de sandbox em ajuste                    ║
║  • Feedback da comunidade é bem-vindo!                   ║
║  • Wipes podem acontecer a qualquer momento              ║
╚══════════════════════════════════════════════════════════╝
```

### Roadmap
- [x] Seleção de mods de clima hardcore
- [x] Seleção de mods de armas e combate
- [x] Seleção de mapas extras
- [x] Validação de Workshop IDs
- [x] Configuração completa de 111 Workshop Items
- [ ] Balanceamento do SandboxVars (zumbis, loot, clima)
- [ ] Testes de compatibilidade entre mods
- [ ] Testes de performance com jogadores
- [ ] Ajuste fino de spawn/população de zumbis
- [ ] Configuração do RandomZombiesFull (sprinters à noite)
- [ ] Feedback da comunidade e ajustes finais
- [ ] Release BETA

---

## 📋 Informações do Servidor

| Info | Valor |
|------|-------|
| **Versão** | 41.78.19 |
| **SO** | Linux 64-bit |
| **Java** | Azul Zulu 17 |
| **RAM** | 8GB (ZGC) |
| **Instância** | servertest |
| **Porta** | 16261 (TCP/UDP) |
| **Status** | 🔴 ALPHA — em testes |

---

## 🎯 Filosofia do Servidor

O objetivo é criar uma experiência onde:

1. **O clima é seu inimigo** — Inverno mata, tempestades destroem, hipotermia é real
2. **Cada ferida importa** — Infecções matam, mordida = amputação ou morte
3. **Recursos são preciosos** — Loot não respawna, gasolina é escassa, comida estraga
4. **Preparação é tudo** — Sem planejamento = morte certa
5. **Exploração recompensa** — Mapas extras com loot militar e desafios únicos
6. **Veículos são raros e valiosos** — Frota variada e realista, sem veículos vanilla genéricos
7. **Imersão total** — Tocar música, inspecionar armas, animações reais

---

## 🗺️ Mapas

O servidor inclui os mapas vanilla + mapas de mods:

| Mapa | Tipo | Descrição |
|------|------|-----------|
| Muldraugh, KY | Vanilla | Cidade inicial clássica |
| West Point, KY | Vanilla | Cidade média com ponte |
| Rosewood, KY | Vanilla | Cidade pequena |
| Riverside, KY | Vanilla | Cidade residencial ao norte |
| Louisville, KY | Vanilla | Metrópole gigante |
| **Louisville Spawnpoints** | Mod | Pontos de spawn em Louisville |
| **Authentic Z Spawn** | Mod | Spawns temáticos com roupas realistas |
| **Save Our Station - Knox Country** | Mod | 5 novas estações meteorológicas em Knox Country |
| **RV Interior** | Mod | Interiores jogáveis de trailers/RVs/ônibus |

---

## 🎮 Mods Instalados (97 Mod IDs / 111 Workshop Items)

### 🔫 Armas e Combate

| Mod ID | Workshop ID | Nome | Descrição |
|--------|-------------|------|-----------|
| Brita | 2200148440 | Brita's Weapon Pack | Pack massivo de armas de fogo — centenas de armas novas com modelos, sons e animações únicos. Inclui pistolas, rifles, shotguns, submetralhadoras, armas pesadas e muito mais |
| Brita_2 | 2460154811 | Brita's Armor Pack | Pack de armaduras e proteções balísticas — coletes, capacetes, viseiras, placas de proteção nível I a IV compatíveis com as armas do Brita |
| BritasArmorBlack | 3028787822 | Brita's Armor - Recolors Black | Retexturas pretas de todas as armaduras do Brita — visual tático e discreto para operações noturnas |
| BritaArmorInsulationFix | 2931233550 | Brita Armor Insulation Fix | Corrige os valores de isolamento térmico excessivos das armaduras do Brita, evitando superaquecimento |
| Arsenal(26)GunFighter | 2297098490 | Arsenal(26) GunFighter | Pack de armas militares e táticas com sistema de customização avançado — miras, silenciadores, grips, lanternas |
| VFExpansion1 | 2667899942 | Vanilla Firearms Expansion | Adiciona mais armas de fogo que se encaixam no lore vanilla — visualmente coerentes e balanceadas com o jogo base |
| Gun Stock Attack Remaster | 3022568814 | Gun Stock Attack | Permite atacar zumbis com a coronha/stock da arma de fogo quando sem munição — não fique indefeso |
| Silencer | 639909479 | Silencer | Adiciona silenciadores como peça de arma ao jogo — reduz drasticamente o som do disparo e a atração de zumbis |
| SlingMod | 2644986930 | Rifle Sling | Sling craftável/saqueável — permite carregar um rifle ou shotgun extra no peito, liberando o slot das costas |
| SlingModFix | 2684045242 | Rifle Sling Fix | Correção de bugs do Rifle Sling original — estabilidade e compatibilidade melhoradas |
| noirrsling | 2786499395 | Noir's Rifle Slings | Sistema avançado de slings — carregue armas de 2 mãos extras no peito e nas costas simultaneamente |
| Noir Sling Tweak | 3027064433 | Noir Sling Tweak (Wear 4 Slings) | Tweak que permite usar todas as 4 posições de sling simultaneamente para máximo carregamento de armas |
| BB_ExtraGunSlot | 3120702374 | Extra Gun Slot | Carregue pistolas na cintura (nas costas) como nos filmes — slot extra para handguns |
| B41OpenAmmoWalk | 2934985376 | Open Ammo Boxes While Walking (B41) | Permite abrir caixas de munição enquanto caminha — não precisa mais parar para recarregar |
| VanillaOpenAmmoWalk | 2934985376 | Open Ammo Boxes While Walking (Vanilla) | Versão vanilla do mod de abrir munição andando — funciona sem outros mods de armas |
| RiskyInspectWeapon | 2948824747 | Inspect Weapon | HUD melhorado para inspecionar sua arma equipada — veja condição, munição e mods sem abrir menus |

### 🚗 Veículos

| Mod ID | Workshop ID | Nome | Descrição |
|--------|-------------|------|-----------|
| tsarslib | 2392709985 | Tsar's Common Library v2.07 | Biblioteca obrigatória para todos os mods de veículos da Tsar — framework de veículos, interiores e física |
| autotsartrailers | 2282429356 | Autotsar Trailers v1.40 | Trailers reboques variados — transporte de carga pesada, tanques de água, geradores móveis |
| AquatsarYachtClub | 2392987599 | Aquatsar Yacht Club v1.19 | Barcos e iates jogáveis — exploração aquática, pesca em alto mar, fuga por rios |
| amclub | 2778576730 | Autotsar Motorclub v1.02 | Motocicletas — veículos rápidos e ágeis para exploração e fuga rápida |
| amclubfix | 3135054761 | Autotsar Motorclub - Better Handling | Melhoria na dirigibilidade das motos do Motorclub — menos derrapagem, controle mais responsivo |
| ATA_Bus | 2592358528 | Autotsar Tuning Atelier - Bus v2.01 | Ônibus customizáveis — transporte de grupo, base móvel, grande capacidade de carga |
| FRUsedCars | 1510950729 | Filibuster Rhymes' Used Cars! | Pack massivo de veículos usados e realistas — dezenas de carros, vans, caminhões e veículos especiais com visual desgastado e autêntico |
| NoVanillaVehicles | 2535461640 | No Vanilla Vehicles | Remove spawns de veículos vanilla genéricos — apenas veículos de mods (mais variados e realistas) aparecem |
| 67commando | 2478247379 | '67 M706 Cadillac Gage Commando V100 | APC blindado M706 — veículo militar pesado, resistente a tiros, capacidade de transporte de tropas |
| 92amgeneralM998 | 2642541073 | '92 AM General M998 + M101A3 Trailer | HMMWV (Humvee) militar 1992 com reboque de carga M101A3 — veículo off-road blindado leve |
| 92amgeneralM998reskin | 2834460958 | '92 AM General M998 Reskin | Variantes visuais do Humvee — camuflagens alternativas |
| 86oshkoshP19A | 2566953935 | '86 Oshkosh P19A + Military Trailers | Caminhão de bombeiros militar Oshkosh P19A + 4 trailers militares — veículo pesado de resgate/transporte |
| 80kz1000 | 2818847163 | '80 Kawasaki KZ1000 Police | Moto policial Kawasaki KZ1000 de 1980 (da série CHiPs) — rápida e ágil para patrulha |
| 28ss100 | 2913634132 | '28 Brough Superior SS100 | Moto clássica de 1928 — rara, estilo vintage, peça de colecionador |
| 82jeepJ10 | 2886832257 | '82 Jeep J10 | Pickup Jeep J10 de 1982 — veículo off-road robusto, boa capacidade de carga |
| 88chevyS10 | 2886832936 | '88 Chevrolet S10 | Pickup Chevrolet S10 de 1988 — veículo utilitário compacto e versátil |
| 67gt500 | 3026723485 | '67 Shelby GT500 + Eleanor | Muscle car Shelby GT500 de 1967 — veículo raro, alta velocidade, estilo clássico americano |
| 82porsche911 | 3379334330 | '82 Porsche 911 | Porsche 911 de 1982 — esportivo raro, alta performance, difícil de encontrar |
| 90bmwE30 | 3110913021 | '90 BMW 3 Series (E30) | BMW E30 de 1990 — sedan esportivo europeu compacto e confiável |
| 87fordB700 | 3110911330 | '87 Ford B700/F700 Trucks | Caminhões Ford B700 (ônibus) e F700 de 1987 — veículos pesados de transporte e carga |
| 87fordF700BoxInterior | 3438003785 | '87 Ford F700 Box Interior | Adiciona interior jogável ao baú do caminhão Ford F700 — base móvel compacta |
| 91fordRanger | 3539691958 | '91 Ford Ranger | Pickup Ford Ranger de 1991 — veículo utilitário leve e econômico |
| 84gageV300 | 3171184800 | '84 Cadillac Gage LAV-300 | Veículo blindado leve LAV-300 de 1984 — APC militar pesado, máxima proteção |
| BZ_LCJ80 | 3171256616 | 1990 Toyota Land Cruiser 80-Series | Toyota Land Cruiser J80 de 1990 — SUV off-road durável, excelente para exploração |
| damnlib | 3171167894 | that DAMN Library | Biblioteca de assets obrigatória para todos os mods de veículos KI5 |
| RV_Interior_MP | 2822286426 | RV Interior (v1.4.14) | Adiciona interiores jogáveis a veículos grandes — RVs, motorhomes e ônibus viram bases móveis completas |
| TsarBus_Interior_MP | 2825126778 | TsarBus Interior MP | Interior jogável para o ônibus do Autotsar — assento de motorista, espaço de carga, área de descanso |
| TsarcraftCache2 | 2688809268 | TCCache MP v2.04 | Cache multiplayer para veículos Tsar — melhora performance e sincronização em servidor |
| BB_Bicycles | 2988491347 | Braven's Bicycles Redux | Bicicletas funcionais — veículo silencioso, sem combustível, ideal para exploração discreta |

### 🧬 Traits, Progressão e Psicologia

| Mod ID | Workshop ID | Nome | Descrição |
|--------|-------------|------|-----------|
| DynamicTraitsSE | 2701370059 | Dynamic Traits Sauce Edition | Perca traits negativos e ganhe positivos durante gameplay — seu personagem evolui com base nas ações realizadas |
| BecomeDesensitized | 2627877543 | Become Desensitized | Seu personagem se dessensibiliza ao horror com o tempo — panic e stress diminuem conforme enfrenta zumbis. Configurável via sandbox |
| Lifestyle | 2997342681 | Lifestyle | Atividades de hobby — seu personagem pode desenvolver hobbies que afetam humor e habilidades ao longo do tempo |

### 🤒 Saúde e Sobrevivência

| Mod ID | Workshop ID | Nome | Descrição |
|--------|-------------|------|-----------|
| Amputation | 2703664356 | The Only Cure | Mordido? Amputação é a única cura! Corte o membro infectado antes que o vírus se espalhe — sobreviva com deficiência permanente |
| WorkingMasks | 2760742937 | Working Masks | Máscaras (como gas masks) realmente protegem contra doenças de cadáveres — reduz ganho de sickness ao usar proteção facial |
| MiniHealthPanel | 2866258937 | Mini Health Panel | Painel minimalista de ferimentos — veja seus ferimentos sem abrir o menu de saúde. Desaparece quando não há feridas |

### 👕 Roupas e Equipamento

| Mod ID | Workshop ID | Nome | Descrição |
|--------|-------------|------|-----------|
| KATTAJ1_ClothesCore | 3470422050 | KATTAJ1 Clothes Core | Core de roupas militares táticas — uniformes, calças cargo, botas, luvas e gear moderno |
| Authentic Z - Current | 2335368829 | Authentic Z | Distribuição realista de roupas em zumbis — mais de 140 zumbis customizados com roupas autênticas baseadas em profissões e estilo de vida |
| MilPoncho | 2629286881 | Ponchos | Substitui o poncho vanilla por modelo militar realista — proteção contra chuva com visual tático |
| ALICE | 533833878 | ALICE Pack Mod | Mochilas ALICE militares (Large e Medium) + frame — sistema de mochila militar autêntico com crafting |
| AliceGear | 3610005735 | ALICE Gear | Equipamento ALICE completo — suspensórios, cintos e pouches militares funcionais |
| FH | 2447729538 | Fluffy Hair | Novos penteados — remove restrição de rabo de cavalo, mais opções estéticas para personagens |
| NVG | 2769995104 | Night Vision Goggles | Óculos de visão noturna funcionais — equipamento militar raro que permite enxergar no escuro |
| NVAPI | 2776633989 | Night Vision API | API obrigatória para o funcionamento dos óculos de visão noturna |
| ROMUSHI | 3614975251 | Roman's Ushankas | Chapéus ushanka (chapéu de pele russo) — proteção térmica contra frio extremo |
| [J&G] British DPM Uniform | 3654107996 | British DPM Uniform | Uniforme militar britânico DPM — camuflagem woodland autêntica das forças armadas UK |

### 🏗️ Construção e Base

| Mod ID | Workshop ID | Nome | Descrição |
|--------|-------------|------|-----------|
| MoreBuilds | 515555911 | More Builds (B41) | Expande massivamente o menu de construção — dezenas de novas construções, móveis e estruturas craftáveis |
| improvedbuildmenu41 | 1969456967 | Improved Build Menu | Menu de construção reorganizado e melhorado — tooltips informativos, capacidades de containers, receitas corrigidas. Requer Item Tweaker API |
| BuildingMenu | 3067798182 | Building Menu [B41.78] | Menu de construção avançado — interface modernizada para todas as opções de construção |
| RemoveDebris | 2927744729 | Remove Debris | Permite remover destroços e objetos feios da sua base — limpeza estética do ambiente |
| ISA_41 | 2969478819 | Immersive Solar Arrays | Painéis solares craftáveis — gere energia limpa para sua base sem depender de geradores e gasolina |

### 🌍 Mundo e Ambiente

| Mod ID | Workshop ID | Nome | Descrição |
|--------|-------------|------|-----------|
| BarricadedWorld | 2696986935 | Barricaded World - Extended Erosion | Mundo mais realista — janelas já quebradas e aleatoriamente barricadas, como se outros sobreviventes já tivessem passado |
| TheyKnew | 2725378876 | They Knew | Eles sabiam o tempo todo — o mundo mostra sinais de que o governo sabia da infecção antes do colapso. Notas, barricadas militares e pistas espalhadas |
| Trash and Corpses | 3231344297 | Trash and Corpses | Lixo e cadáveres antigos espalhados pelo mundo — ambiente pós-apocalíptico mais imersivo e desolador |
| RainWash | 2657661246 | Rain Wash | Chuva lava sangue e sujeira do seu personagem e do mundo — limpeza natural pelo clima |
| SaveOurStation_Core | 2398274461 | Save Our Station - Core | Sistema de estações meteorológicas reparáveis — eventos de reparo automatizados para restaurar transmissões de rádio |
| SaveOurStation_KnoxCountry | 2398274461 | Save Our Station - Knox Country | 5 novas estações meteorológicas em Knox Country para reparar e reativar |
| LouisVille SP | 2678653895 | Louisville Spawnpoints | Pontos de spawn em Louisville — comece direto na metrópole para desafio máximo |

### 🎵 Entretenimento e Imersão

| Mod ID | Workshop ID | Nome | Descrição |
|--------|-------------|------|-----------|
| truemusic | 2613146550 | True Music v2.15 | Toque instrumentos musicais de verdade — guitarras, violões, baterias. Sistema completo de música in-game |
| truemusic_brazilian_songs_vol2 | 3291589876 | BR Songs Vol.2 (True Music Addon) | Pacote de músicas brasileiras para o True Music — MPB, rock nacional e mais |
| null_tm_musicasbrasileiras | 2973474633 | True Music Addon: Brasileiras | Músicas brasileiras diversas para tocar com o True Music |
| TMC_TrueActions | 2487022075 | TrueActions v1.09 | Ações imersivas — sentar em cadeiras, encostar em paredes, deitar no chão, animações realistas de interação |
| Anim_HandTorch | 2960474000 | New Flashlight Animation | Nova animação de lanterna — segurar a lanterna de forma mais realista e imersiva |

### 🛠️ QoL (Quality of Life)

| Mod ID | Workshop ID | Nome | Descrição |
|--------|-------------|------|-----------|
| ProximityInventory | 2847184718 | Proximity Inventory | Inventário de proximidade — veja e acesse itens de containers próximos sem precisar abrir cada um individualmente |
| ProximityInventory4213 | 3624308198 | Proximity Inventory 42.13 Compatibility | Versão compatível com PZ 42.13 — substituto standalone do Proximity Inventory original |
| OutTheWindow | 2659216714 | Out the Window | Jogue cadáveres pela janela! Solução imersiva para limpar corpos dos andares superiores da sua base |
| BB_CommonSense | 2875848298 | Common Sense | Melhorias variadas de qualidade de vida — pequenos ajustes de bom senso que o jogo base deveria ter |
| BB_Utils | 2850135071 | Braven's Utilities | Biblioteca de utilitários para modders — funções auxiliares usadas por outros mods do Braven |
| BB_FreeHotwiring | 3106149504 | Free Hotwiring | Qualquer personagem pode fazer hotwire em veículos — sem restrição de habilidade elétrica |
| BB_BreakingIn | 2978007916 | Breaking In | Arrombar portas, janelas e veículos com pé de cabra — mais opções de entrada forçada |
| REORDER_THE_HOTBAR | 2903771337 | Reorder The Hotbar | Reorganize a hotbar arrastando itens — clique e arraste para rearranjar posições |
| CatsReadMod | 2690908199 | Cat's Reading Mod | Leitura mais rápida — sentar acelera ainda mais. Ler andando é permitido (shift para parar) |
| CatsWalkWhileReadMod | 2694748270 | Cat's Walk While Reading Mod | Ler enquanto caminha — qualidade de vida para multitasking durante leitura |
| NoLighterNeeded | 2714198296 | I Don't Need A Lighter | Acenda cigarros em fogões, fogueiras e qualquer fonte de fogo — sem depender de isqueiro |
| Easily Find The Key | 2892005713 | Easily Find The Key | Encontre chaves de veículos com mais facilidade — menos frustração ao procurar chaves |
| MinimalDisplayBars | 2004998206 | Minimal Display Bars | Barras minimalistas de status (fome, sede, saúde) no canto da tela — HUD discreto e informativo |
| POM | 2879960936 | PlayersOnMap | Mostra jogadores no mapa e minimapa — localização de aliados em tempo real |
| UIAPI | 2760035814 | Simple UI API | API de interface simples — dependência para mods que criam UIs customizadas |
| TheStar | 2619072426 | Weapon Condition Indicator | Mostra condição/durabilidade da arma na hotbar — veja desgaste sem abrir inventário |
| P4OnTheDoor | 3056481712 | On the Door | Funcionalidades extras para portas — interações adicionais |
| errorMagnifier | 2896041179 | errorMagnifier | Ferramenta de debug — popups in-game para reportar erros de forma clara (útil para testar mods) |
| BetterFPS | 3022543997 | BetterFPS | Ajuste de configurações de renderização para melhorar FPS geral — otimização de performance |
| TargetSquareOnLoad | 2969455858 | Target Square: On Load Commands | Otimização técnica — dispara funções ao carregar tiles, evita checagens redundantes entre mods |
| ChuckleberryFinnAlertSystem | 3077900375 | Mod Update Alert System | Sistema de notificação de atualizações de mods — alerta quando mods são atualizados |
| EasyConfigChucked | 2529746725 | Easy Config Chucked | Menu de configuração fácil para mods — interface unificada de opções |
| modoptions | 2169435993 | Mod Options | Permite customizar configurações de mods in-game — painel central de opções |

### 🔧 APIs e Dependências

| Mod ID | Workshop ID | Nome | Descrição |
|--------|-------------|------|-----------|
| ItemTweakerAPI | 566115016 | Item Tweaker API | API para modificar propriedades de itens — dependência obrigatória para Improved Build Menu e outros |
| ModelTweakerAPI | 2432114128 | Model Tweaker API | API para modificar modelos 3D de itens — dependência para mods visuais |

### 🌐 Traduções

| Mod ID | Workshop ID | Nome | Descrição |
|--------|-------------|------|-----------|
| TraducaoPTBR-Arsenal(26)GunFighter | 2714006083 | Tradução PTBR Arsenal GunFighter | Tradução completa para português brasileiro do mod Arsenal(26) GunFighter |
| TradPTBR-Brita | 2715816518 | Tradução PTBR Brita's Weapon Pack | Tradução para português brasileiro do Brita's Weapon Pack |
| TradPTBR-TMC_TrueActions | 2737954303 | Tradução PTBR TrueActions | Tradução para português brasileiro do TrueActions |
| TheOnlyCurePTBR | 2788406065 | The Only Cure PTBR | Tradução PTBR do The Only Cure — "Corte seu braço e sobreviva" |
| Save Our Station! PTBR | 2939435031 | Save Our Station PTBR | Tradução PTBR completa do Save Our Station |
| NatoCamuflageSkinbyFranek | 3539519654 | AM General M998 NATO Camo Skin | Skin de camuflagem NATO para o Humvee M998 |

---

## ⚙️ Configuração Principal

> ⚠️ Valores em fase de teste — sujeitos a mudança

### Gameplay
- **PVP:** Ativado com Safety System
- **Dificuldade:** Hardcore (clima letal, doenças, recursos escassos)
- **Loot Respawn:** Desativado
- **Safehouses:** Jogadores podem claimar

### Zumbis
- **População:** High (multiplicador 2.0)
- **Velocidade:** Fast Shamblers (dia) / Configurável por mods
- **Respawn:** 72h após célula limpa
- **Pico:** Dia 28 (multiplicador 1.5x)

---

## 📦 Dependências entre Mods

```
Brita's Weapon Pack ──► Item Tweaker API
Improved Build Menu ──► Item Tweaker API
Brita's Armor Pack ──► Brita's Weapon Pack
Brita Armor Insulation Fix ──► Brita's Armor Pack
BritasArmorBlack ──► Brita's Armor Pack
Arsenal(26) GunFighter ──► Item Tweaker API

Autotsar Trailers ──► Tsar's Common Library
Autotsar Motorclub ──► Tsar's Common Library
Aquatsar Yacht Club ──► Tsar's Common Library
ATA Bus ──► Tsar's Common Library
80 Kawasaki KZ1000 ──► Tsar's Common Library + Autotsar Motorclub
28 Brough Superior ──► Tsar's Common Library + Autotsar Motorclub
Motorclub Better Handling ──► Autotsar Motorclub
TsarBus Interior ──► ATA Bus

84 Cadillac Gage LAV-300 ──► that DAMN Library
87 Ford B700/F700 ──► that DAMN Library
87 Ford F700 Box Interior ──► 87 Ford B700/F700
Toyota Land Cruiser ──► that DAMN Library

Night Vision Goggles ──► Night Vision API
Noir Sling Tweak ──► Noir's Rifle Slings
Rifle Sling Fix ──► Rifle Sling

RV Interior ──► Tsar's Common Library
Save Our Station Knox ──► Save Our Station Core
True Music Addons ──► True Music
ProximityInventory 4213 ──► (standalone, NÃO usar com original)
```

---

## 🛠️ Scripts Úteis

| Script | Uso |
|--------|-----|
| `scripts/buscar_workshop.sh` | Buscar Workshop IDs de mods na Steam |
| `scripts/validar_ids.sh` | Validar se IDs existem na Steam |

---

## 📁 Estrutura de Arquivos

```
Servidor-Zomboid/
├── Zomboid/
│   ├── Server/
│   │   ├── servertest.ini              # Config principal
│   │   ├── servertest_SandboxVars.lua  # Sandbox (zumbis, loot, clima)
│   │   ├── servertest_spawnregions.lua # Regiões de spawn
│   │   └── servertest_spawnpoints.lua  # Pontos de spawn
│   ├── Saves/Multiplayer/              # Saves do mundo
│   └── db/servertest.db               # Whitelist/contas
└── pzserver/
    ├── start-server.sh                 # Script de inicialização
    └── ProjectZomboid64.json           # Config JVM (RAM, GC)
```

---

## 🤝 Contribuindo

Este projeto aceita sugestões da comunidade! Se você tem ideias para:
- Novos mods que combinem com a proposta hardcore
- Ajustes de balanceamento
- Configurações de sandbox
- Bugs ou incompatibilidades entre mods

Abra uma **Issue** ou mande mensagem!

---

## 📝 Licença

Projeto open-source para documentação e compartilhamento de configurações de servidor Project Zomboid.
