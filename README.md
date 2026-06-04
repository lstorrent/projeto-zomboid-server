# 🧟 Servidor Project Zomboid - Hardcore Survival

> ✅ **PROJETO EM FASE BETA** — Lista oficial de mods definida. Servidor pronto para testes com jogadores.

🌐 **Site do Projeto:** [https://lstorrent.github.io/projeto-zomboid-server/](https://lstorrent.github.io/projeto-zomboid-server/)

![Project Zomboid](https://img.shields.io/badge/Project%20Zomboid-v41.78.19-green)
![Mods](https://img.shields.io/badge/Mods-90-blue)
![Players](https://img.shields.io/badge/Max%20Players-16-orange)
![Status](https://img.shields.io/badge/Status-BETA-yellow)

---

## 🎯 Sobre o Servidor

Este servidor foi projetado para um **grupo de amigos** que querem jogar juntos em um cenário hardcore survival. A proposta é um **PVE cooperativo com PVP sempre ativo**, sem botão para desligar — isso adiciona realismo e tensão ao jogo, já que qualquer jogador pode ser uma ameaça real, mesmo entre aliados.

**Filosofia do servidor:**
- 🤝 Feito para amigos jogarem juntos, não é um servidor público competitivo
- ⚔️ PVP ativo 24/7 sem Safety System — realismo acima de tudo
- 🧊 Mundo congela quando não há jogadores online (`PauseEmpty=true`) — nenhum progresso de tempo, zumbis ou deterioração acontece sem ninguém conectado
- 🚫 Sem facções — o grupo já é a facção
- 🎒 Loot não respawna — o que existe no mundo é tudo o que há
- 🧟 Zumbis migram e respawnam — o mundo nunca fica seguro

---

## ⚠️ Aviso de Segurança

> **Este repositório contém arquivos de configuração BASE.** Se você pretende fazer download e utilizar estas configs em outro servidor, **altere obrigatoriamente:**
>
> | O que alterar | Arquivo | Motivo |
> |---------------|---------|--------|
> | `Password` | servertest.ini | Senha padrão exposta |
> | `RCONPassword` | servertest.ini | Acesso remoto ao console |
> | `PublicName` | servertest.ini | Identificação do servidor |
> | `ResetID` / `ServerPlayerID` | servertest.ini | IDs únicos por servidor |
>
> **Nunca utilize senhas padrão em um servidor público ou acessível pela internet.**

---

## 🚧 Status do Projeto

```
╔══════════════════════════════════════════════════════════╗
║  🟡 BETA - Lista oficial definida, testes com players    ║
║                                                          ║
║  • Lista de mods oficialmente definida                   ║
║  • Configurações de sandbox ajustadas                    ║
║  • Feedback da comunidade é bem-vindo!                   ║
║  • Wipes podem acontecer em caso de bugs críticos        ║
╚══════════════════════════════════════════════════════════╝
```

### Roadmap
- [x] Seleção de mods de clima hardcore
- [x] Seleção de mods de armas e combate
- [x] Seleção de mapas extras
- [x] Validação de Workshop IDs
- [x] Configuração completa de 90 Workshop Items
- [x] Configuração do servertest_SandboxVars.lua
- [x] Lista oficial de mods definida
- [ ] Testes de compatibilidade entre mods
- [ ] Testes de performance com jogadores
- [ ] Ajuste fino de spawn/população de zumbis
- [ ] Configuração do RandomZombiesFull (sprinters à noite)
- [ ] Feedback da comunidade e ajustes finais
- [ ] Release STABLE

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
| **Mods** | 90 Workshop Items |
| **PVP** | Sempre ativo (sem Safety System) |
| **Loot Respawn** | Desativado |
| **Veículos Vanilla** | Removidos (só mods) |
| **Hotwiring** | Livre para todos |
| **VOIP** | Ativado (3D direcional) |
| **Mundo sem players** | Congelado (PauseEmpty) |
| **Facções** | Desativadas |
| **Status** | 🟡 BETA — lista oficial definida |

---

## ⚙️ Configurações Alteradas

Os arquivos `servertest.ini` e `servertest_SandboxVars.lua` foram ajustados manualmente para atender um grupo de amigos em uma experiência hardcore survival. Abaixo as principais decisões:

### servertest.ini (principais)

| Configuração | Valor | Motivo |
|--------------|-------|--------|
| `PVP` | true | Realismo — qualquer um pode atacar |
| `SafetySystem` | false | Sem botão de PVP on/off |
| `PauseEmpty` | true | Mundo congela sem jogadores online |
| `MaxPlayers` | 16 | Performance com 97 mods |
| `Faction` | false | Grupo de amigos, sem necessidade |
| `PlayerSafehouse` | false | Sem safehouses protegidas |
| `SleepAllowed` | false | Servidor não pausa por sono |
| `HoursForLootRespawn` | 0 | Sem respawn de loot |
| `VoiceEnable` | true | VOIP 3D direcional |
| `DoLuaChecksum` | true | Anti-cheat de arquivos |
| `BackupsCount` | 3 | Mantém últimos 3 backups |

### servertest_SandboxVars.lua (principais)

| Configuração | Valor | Motivo |
|--------------|-------|--------|
| `DayLength` | 4 (2h reais) | Ciclo dia/noite mais longo |
| `WaterShutModifier` | 45 dias | Água corta no dia 45 |
| `ElecShutModifier` | 40 dias | Luz corta no dia 40 |
| `LootRespawn` | None | Loot não reaparece |
| `Zombies` | High | Alta quantidade de zumbis |
| `ZombieLore.Speed` | Fast Shamblers | Rápidos mas não correm |
| `ZombieLore.Transmission` | Blood + Saliva | Infecção por sangue e mordida |
| `ZombieLore.Mortality` | 2-3 Days | Morte lenta após infecção |
| `PopulationPeakDay` | 28 | Pico de zumbis no dia 28 |
| `RespawnHours` | 72h | Zumbis respawnam a cada 72h |
| `RedistributeHours` | 12h | Zumbis migram a cada 12h |
| `HoursForCorpseRemoval` | 72h (3 dias) | Corpos somem em 3 dias |
| `DamageToPlayerFromHitByACar` | Normal | Atropelamento causa dano |
| `MultiHitZombies` | false | Sem hit múltiplo (mais difícil) |
| `AllowMiniMap` | false | Sem minimapa |

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
│   ├── servertest.ini              # Config principal do servidor
│   └── servertest_SandboxVars.lua  # Config de sandbox (zumbis, loot, clima, eventos)
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

## 📝 Notas Técnicas

- Os arquivos `.ini` e `.lua` foram editados manualmente e testados em conjunto para garantir coerência entre as configurações do servidor e do sandbox
- O servidor utiliza `PauseEmpty=true` — quando o último jogador desconecta, o mundo inteiro congela: zumbis param, tempo não avança, comida não estraga, plantas não crescem. Isso é ideal para grupos de amigos que não jogam 24/7
- O `DayLength=4` (2h reais por ciclo) foi escolhido para dar tempo de explorar e sobreviver sem que o dia passe rápido demais
- Anti-cheat tipo 21 está desabilitado por compatibilidade com mods de veículos
- O `CarEngineAttractionModifier=0.5` reduz a atração de zumbis por motores para evitar lag com muitos mods de veículos

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
