# Dashboard d'estat del projecte

Matriu de monitoratge de totes les branques de treball de l'incident. Es manté actualitzada de forma conjunta per l'Agent 1 i l'Agent 2 com a part de la tasca d'Auditoria.

| Branca | Responsable | Estat | PR | Observacions |
|---|---|---|---|---|
| `main` | Agent 1 + Agent 2 | Protegida (requereix PR + 1 aprovació, també per a administradors) | — | Branca base del repositori. Només s'hi fusiona via Pull Request. |
| `projecte/spectral-data` | Agent 1 (Admin/Dades) | Fase 1 completada, pendent de revisió | [#1](../../pull/1) | Inclou `data/ghost_hosts.csv`, `docs/contracte-dades.md` i la bitàcola de Fase 1. Esperant aprovació de MiguelVico. |
| `projecte/defense-script` | Agent 2 (Scripting) — MiguelVico | No iniciada | — | Pendent que MiguelVico creï la branca i desenvolupi `scripts/exorcism.ps1` a partir del contracte de dades (Issue [#2](../../issues/2)). |
| `feature/status-dashboard` | Agent 1 + Agent 2 | En curs | Pendent de crear | Introdueix aquest mateix fitxer `reports/dashboard.md`. |

## Llegenda d'estats

- **No iniciada:** la branca encara no existeix.
- **En curs:** hi ha treball actiu, sense PR oberta encara o amb PR en revisió.
- **Fase 1 completada, pendent de revisió:** els commits estan fets i la PR és oberta, esperant aprovació.
- **Fusionada:** la PR corresponent ha estat aprovada i fusionada a `main`.
