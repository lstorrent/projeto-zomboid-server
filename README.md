# 🧟 Servidor Project Zomboid - Hardcore Survival

> ✅ **STABLE v1.0** — Servidor em produção. Todos os mods testados e funcionando sem erros.

🌐 **Site do Projeto:** [https://lstorrent.github.io/projeto-zomboid-server/](https://lstorrent.github.io/projeto-zomboid-server/)

![Project Zomboid](https://img.shields.io/badge/Project%20Zomboid-Build%2042%20unstable-green)
![Mods](https://img.shields.io/badge/Mods-78-blue)
![Players](https://img.shields.io/badge/Max%20Players-16-orange)
![Status](https://img.shields.io/badge/Status-STABLE%20v1.0-brightgreen)

---

## 🎯 Sobre o Servidor

Este servidor foi projetado para um **grupo de amigos** que querem jogar juntos em um cenário hardcore survival. A proposta é um **PVE cooperativo com PVP sempre ativo**, sem botão para desligar — isso adiciona realismo e tensão ao jogo, já que qualquer jogador pode ser uma ameaça real, mesmo entre aliados.

**Filosofia do servidor:**
- 🤝 Feito para amigos jogarem juntos, não é um servidor público competitivo
- ⚔️ PVP ativo 24/7 sem Safety System — realismo acima de tudo
- 🧊 Mundo congela quando não há jogadores online (`PauseEmpty=true`) — nenhum progresso de tempo, zumbis ou deterioração acontece sem ninguém conectado
- 🚫 Sem facções — o grupo já é a facção
- 🎒 Loot não respawna — o que existe no mundo é tudo o que há
- 🧟 Zumbis migram entre células — o mundo nunca fica totalmente seguro

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

## ✅ Status do Projeto

```
╔══════════════════════════════════════════════════════════╗
║  🟢 STABLE v1.0 - Servidor em produção                  ║
║                                                          ║
║  • Todos os 79 mods testados e rodando sem erros         ║
║  • Servidor configurado como serviço (systemd)           ║
║  • Reinício automático a cada 12 horas                   ║
║  • Configurações de sandbox finalizadas                  ║
╚══════════════════════════════════════════════════════════╝
```

### Roadmap
- [x] Seleção de mods de clima hardcore
- [x] Seleção de mods de armas e combate
- [x] Seleção de mapas extras
- [x] Validação de Workshop IDs
- [x] Configuração completa de 79 Workshop Items
- [x] Configuração do servertest_SandboxVars.lua
- [x] Lista oficial de mods definida
- [x] Testes de compatibilidade entre mods
- [x] Testes de performance com jogadores
- [x] Servidor como serviço (systemd + restart 12h)
- [x] Release STABLE v1.0

---

## 📋 Informações do Servidor

| Info | Valor |
|------|-------|
| **Versão** | Build 42 (unstable) |
| **SO** | Ubuntu Linux 64-bit |
| **RAM** | 16GB (ZGC) |
| **Instância** | servertest |
| **Porta** | 16261 (TCP/UDP) |
| **Max Players** | 16 |
| **Mods** | 79 Workshop Items |
| **PVP** | Sempre ativo (sem Safety System) |
| **Loot Respawn** | Desativado |
| **Hotwiring** | Livre para todos |
| **VOIP** | Ativado (3D direcional) |
| **Mundo sem players** | Congelado (PauseEmpty) |
| **Facções** | Desativadas |
| **Status** | 🟢 STABLE v1.0 |
| **Serviço** | systemd (restart automático 12h) |

---

## ⚙️ Configurações Alteradas

Os arquivos `servertest.ini` e `servertest_SandboxVars.lua` foram ajustados manualmente para atender um grupo de amigos em uma experiência hardcore survival. Abaixo as principais decisões:

### servertest.ini (principais)

| Configuração | Valor | Motivo |
|--------------|-------|--------|
| `PVP` | true | Realismo — qualquer um pode atacar |
| `SafetySystem` | false | Sem botão de PVP on/off |
| `PauseEmpty` | true | Mundo congela sem jogadores online |
| `MaxPlayers` | 16 | Performance com 79 mods |
| `Faction` | false | Grupo de amigos, sem necessidade |
| `PlayerSafehouse` | false | Sem safehouses protegidas |
| `SleepAllowed` | false | Servidor não pausa por sono |
| `HoursForLootRespawn` | 0 | Sem respawn de loot |
| `VoiceEnable` | true | VOIP 3D direcional |
| `DoLuaChecksum` | false | Evita desconexão por mismatch de mods |
| `BackupsCount` | 3 | Mantém últimos 3 backups |
| `SaveWorldEveryMinutes` | 5 | Auto-save a cada 5 minutos |

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
| `RespawnHours` | 0 (desativado) | Zumbis não respawnam |
| `RedistributeHours` | 12h | Zumbis migram a cada 12h |
| `HoursForCorpseRemoval` | 72h (3 dias) | Corpos somem em 3 dias |
| `DamageToPlayerFromHitByACar` | Normal | Atropelamento causa dano |
| `MultiHitZombies` | false | Sem hit múltiplo (mais difícil) |
| `AllowMiniMap` | false | Sem minimapa |

---

## 📦 Mods

**78 Workshop Items** — [Ver detalhes de cada mod no site](https://lstorrent.github.io/projeto-zomboid-server/)

Referência técnica com dados da Steam API: [MODS.md](./MODS.md)

### Resumo por categoria

| Categoria | Qtd | Destaques |
|-----------|-----|-----------|
| 🔫 Armas e Combate | 27 | Brita's, Arsenal GunFighter, Slings, Tactical Hold |
| 🚗 Veículos | 20 | Filibuster, Cadillac Commando, Bicicletas |
| 🏗️ Construção e Base | 5 | More Builds, Building Menu, Solar Arrays |
| 👕 Roupas | 9 | ALICE, KATTAJ1, J&G Uniforms, NVG |
| 🛠️ QoL e Interface | 4 | Proximity Inventory, Dynamic Traits |
| 🔧 APIs e Dependências | 6 | Mod Options, Braven's Utils, NVAPI |
| 🗺️ Mapas e Spawns | 1 | Louisville Spawnpoints |
| 🌐 Traduções | 5 | PTBR para Arsenal, Brita, TrueActions |

---

## 📦 Dependências entre Mods

```
Brita's Weapon Pack ──► Item Tweaker API
Improved Build Menu ──► Item Tweaker API
Brita's Armor Pack ──► Brita's Weapon Pack
Brita Armor Insulation Fix ──► Brita's Armor Pack
BritasArmorBlack ──► Brita's Armor Pack
Arsenal(26) GunFighter ──► Item Tweaker API

Night Vision Goggles ──► Night Vision API
Noir Sling Tweak ──► Noir's Rifle Slings
Rifle Sling Fix ──► Rifle Sling

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

- **Servidor como serviço:** O servidor roda como serviço systemd, com reinício automático a cada 12 horas para manutenção de performance e liberação de memória
- **Mods sem erros:** Todos os 79 Workshop Items foram testados em conjunto — zero erros no console do servidor durante gameplay
- Os arquivos `.ini` e `.lua` foram editados manualmente e testados em conjunto para garantir coerência entre as configurações do servidor e do sandbox
- O servidor utiliza `PauseEmpty=true` — quando o último jogador desconecta, o mundo inteiro congela: zumbis param, tempo não avança, comida não estraga, plantas não crescem. Isso é ideal para grupos de amigos que não jogam 24/7
- O `DayLength=4` (2h reais por ciclo) foi escolhido para dar tempo de explorar e sobreviver sem que o dia passe rápido demais
- Anti-cheat está totalmente desabilitado por compatibilidade com mods
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
