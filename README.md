# 🧟 Servidor Project Zomboid - Hardcore Survival

> ⚠️ **PROJETO EM FASE ALPHA** — Configurações em desenvolvimento, testes e aceitação da comunidade. O objetivo é criar um servidor o mais próximo possível do **perfeito hardcore survival**.

🌐 **Site do Projeto:** [https://lstorrent.github.io/projeto-zomboid-server/](https://lstorrent.github.io/projeto-zomboid-server/)

![Project Zomboid](https://img.shields.io/badge/Project%20Zomboid-v41.78.19-green)
![Mods](https://img.shields.io/badge/Mods-97-blue)
![Players](https://img.shields.io/badge/Max%20Players-16-orange)
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
| **Max Players** | 16 |
| **Mods** | 97 Mod IDs / 111 Workshop Items |
| **PVP** | Ativado (Safety System) |
| **Loot Respawn** | Desativado |
| **Veículos Vanilla** | Removidos (só mods) |
| **Hotwiring** | Livre para todos |
| **VOIP** | Ativado (3D direcional) |
| **Status** | 🔴 ALPHA — em testes |

---

## 📦 Mods

**97 Mod IDs / 111 Workshop Items** — [Ver detalhes de cada mod no site](https://lstorrent.github.io/projeto-zomboid-server/)

Referência técnica com dados da Steam API: [MODS.md](./MODS.md)

### Resumo por categoria

| Categoria | Qtd | Destaques |
|-----------|-----|-----------|
| 🔫 Armas e Combate | 16 | Brita's, Arsenal GunFighter, VFE, Silencer |
| 🚗 Veículos | 22 | Filibuster, KI5, Tsar, Motos, Bicicletas |
| 🧬 Traits e Saúde | 6 | Dynamic Traits, Amputação, Working Masks |
| 👕 Roupas | 9 | Authentic Z, ALICE, NVG, British DPM |
| 🏗️ Construção | 5 | More Builds, Building Menu, Solar Arrays |
| 🌍 Mundo | 6 | Barricaded World, They Knew, Rain Wash |
| 🎵 Imersão | 5 | True Music, TrueActions, 768 músicas BR |
| 🛠️ QoL | 13 | Proximity Inventory, Hotbar, BetterFPS |
| 🔧 APIs | 6 | Tsar Lib, DAMN Lib, Item Tweaker |
| 🌐 Traduções | 6 | PTBR para Arsenal, Brita, TrueActions |

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

## ⚙️ Configuração do Servidor

### servertest.ini (principais)

| Configuração | Valor | Motivo |
|--------------|-------|--------|
| `MaxPlayers` | 16 | Performance com 97 mods |
| `PVP` | true | Hardcore — Safety System ativo |
| `HoursForLootRespawn` | 0 | Sem respawn de loot |
| `PlayerSafehouse` | false | Em teste |
| `SleepAllowed` | false | Servidor não pausa |
| `VoiceEnable` | true | VOIP 3D |
| `Voice3D` | true | Áudio direcional |
| `DoLuaChecksum` | true | Anti-cheat de arquivos |
| `NoVanillaVehicles` | (mod) | Só veículos de mods |

### Mapas configurados

```
Map=vehicle_interior;AZSpawn;SaveOurStation_KnoxCountry_World;Louisville, KY;Muldraugh, KY;West Point, KY;Rosewood, KY;Riverside, KY
```

---

## 🛠️ Scripts

| Script | Uso |
|--------|-----|
| `scripts/buscar_workshop.sh` | Busca mods por nome ou ID na Steam API |
| `scripts/validar_ids.sh` | Valida se todos os Workshop IDs estão ativos |
| `scripts/detalhar_mods.sh` | Extrai detalhes completos via API (MD/JSON/CSV) |
| `scripts/gerar_readme_mods.sh` | Gera MODS.md automaticamente da Steam API |

### Exemplos de uso

```bash
# Buscar detalhes de um mod
./scripts/buscar_workshop.sh --id 2200148440

# Validar todos os IDs do servidor
./scripts/validar_ids.sh configs/servertest.ini

# Regenerar MODS.md com dados atualizados
cd scripts && bash gerar_readme_mods.sh ../configs/servertest.ini > ../MODS.md
```

---

## 📁 Estrutura do Projeto

```
projeto-zomboid-server/
├── configs/
│   └── servertest.ini              # Config principal do servidor
├── docs/
│   └── index.html                  # Site GitHub Pages (vitrine para jogadores)
├── scripts/
│   ├── buscar_workshop.sh          # Busca mods na Steam API
│   ├── validar_ids.sh              # Valida Workshop IDs
│   ├── detalhar_mods.sh            # Extrai detalhes (MD/JSON/CSV)
│   └── gerar_readme_mods.sh        # Gera MODS.md automaticamente
├── MODS.md                         # Referência técnica (gerado automaticamente)
└── README.md                       # Este arquivo (documentação dev/admin)
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
