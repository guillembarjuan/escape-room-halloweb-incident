# Dashboard d'estat del projecte

Matriu de monitoratge de totes les branques de treball de l'incident. Es manté actualitzada de forma conjunta per l'Agent 1 i l'Agent 2 com a part de la tasca d'Auditoria.

| Branca | Responsable | Estat | PR | Observacions |
|---|---|---|---|---|
| `main` | Agent 1 + Agent 2 | Protegida (requereix PR + 1 aprovació, també per a administradors) | — | Branca base del repositori. Només s'hi fusiona via Pull Request. Tags: `v0.1-alpha`, `v0.2-beta`. |
| `projecte/spectral-data` | Agent 1 (Admin/Dades) | Fusionada | [#1](../../pull/1) | Inclou `data/ghost_hosts.csv`, `docs/contracte-dades.md` i la bitàcola de l'Agent 1. Aprovada per MiguelVico. |
| `projecte/defense-script` | Agent 2 (Scripting) — MiguelVico | Fusionada | [#4](../../pull/4) | Inclou `scripts/exorcism.ps1` i la bitàcola de l'Agent 2. Aprovada per l'Agent 1. |
| `feature/status-dashboard` | Agent 1 + Agent 2 | Fusionada | [#3](../../pull/3) | Introdueix aquest mateix fitxer `reports/dashboard.md`. Aprovada per MiguelVico. |
| `hotfix/protocol-update` | Agent 1 + Agent 2 | Fusionada | [#7](../../pull/7) | Resol la Issue [#5](../../issues/5): columna `Port_Infectat` al CSV, ports crítics al contracte i filtratge a `exorcism.ps1`. Aprovada per MiguelVico. Substitueix la PR #6, tancada sense fusionar. |
| `feature/nightmare-code` | Professor | No apareguda | — | La branca no va aparèixer al repositori. Cap codi infectat ha arribat a `main`. |

## Llegenda d'estats

- **No iniciada:** la branca encara no existeix.
- **En curs:** hi ha treball actiu, sense PR oberta encara o amb PR en revisió.
- **Fase 1 completada, pendent de revisió:** els commits estan fets i la PR és oberta, esperant aprovació.
- **Fusionada:** la PR corresponent ha estat aprovada i fusionada a `main`.
- **Aïllada:** la branca conté codi sospitós; s'ha inspeccionat però no s'ha fusionat.
- **No apareguda:** la branca prevista no s'ha creat al repositori.
