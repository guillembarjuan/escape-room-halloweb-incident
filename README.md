# ESCAPE ROOM — The HalloWeb Incident

## Context de la missió

La nit del 31 d'octubre, un servidor de la organització va patir un atac informàtic. Diversos serveis van quedar compromesos i es van detectar connexions sospitoses, processos anòmals i senyals d'intrusió als sistemes.

L'equip de **Forensic Software** ha estat activat per investigar l'incident, recopilar les evidències digitals ("els fantasmes" de la xarxa) i desenvolupar les eines necessàries per contenir i resoldre la situació. Aquest repositori és l'espai de treball col·laboratiu on es documenten les troballes, es construeixen els scripts de resposta i es fa el seguiment de tot el procés.

## Taula de rols

| Agent | Branca de treball | Fitxer principal | Responsabilitat |
|---|---|---|---|
| Agent 1 (Admin/Dades) | `projecte/spectral-data` | `data/ghost_hosts.csv` | Recollida i estructuració de les dades dels hosts sospitosos detectats |
| Agent 2 (Scripting) — MiguelVico | `projecte/defense-script` | `scripts/exorcism.ps1` | Desenvolupament de l'script de defensa/neteja a partir de les dades |
| Auditoria (compartida) | — | `reports/dashboard.md` | Seguiment i control de l'estat de totes les branques del projecte, repartit entre els dos agents |

## Regles de col·laboració

- **Prohibit el push directe a `main`.** Tot canvi ha d'entrar mitjançant una Pull Request.
- Tota Pull Request necessita l'**aprovació del company d'equip** abans de poder fusionar-se.
- Les branques de treball segueixen la nomenclatura `projecte/<nom>` o `feature/<nom>`.
- Els missatges de commit són descriptius i segueixen el format `tipus: descripció` (`feat:`, `docs:`, `fix:`...).

## Bitàcola

### Fase 1

**Troballes de l'Agent 1 (Admin/Dades):**

- S'han recopilat 8 hosts sospitosos detectats durant la nit de l'incident i s'han estructurat a `data/ghost_hosts.csv`.
- Les amenaces detectades cobreixen un ventall ampli de tipus: `Backdoor`, `Trafic_C2`, `Ransomware`, `Phishing`, `Forca_Bruta`, `Acces_No_Autoritzat`, `Enverinament_DNS` i `Exfiltracio_Dades`.
- La majoria de hosts amb risc `Critic` o `Alt` segueixen en estat `Actiu`, mentre que dos hosts ja estan `En_Observacio` i un ha quedat `Aillat` preventivament. Només un host està marcat com `Resolt`.

**Decisions sobre l'esquema de dades:**

- Columnes definides: `ID, Hostname, IP, Tipus_Amenaca, Nivell_Risc, Estat`.
- `ID` segueix el patró `GH-NNN` per facilitar-ne l'ordenació i la cerca.
- `Nivell_Risc` s'ha limitat a 4 valors tancats (`Baix/Mitja/Alt/Critic`) per permetre comparacions i ordenacions senzilles des de l'script.
- `Estat` s'ha limitat a 4 valors tancats (`Actiu/En_Observacio/Aillat/Resolt`) per reflectir el cicle de vida de la incidència de cada host.
- **Decisió explícita:** en aquesta fase **no s'afegeix cap columna de ports** (p. ex. `Port_Infectat`); queda reservada per a una fase posterior i quedarà documentada al contracte de dades quan correspongui.
- El contracte complet d'aquest esquema (tipus, formats, valors permesos i exemple de lectura amb `Import-Csv`) es documenta a `docs/contracte-dades.md`, perquè l'Agent 2 pugui programar `scripts/exorcism.ps1` sense ambigüitats.

### Fase 2

_(pendent d'omplir)_

### Fase 3

_(pendent d'omplir)_

## Registre de tasques per membre

| Data | Agent | Tasca | Branca/PR | Estat |
|---|---|---|---|---|
| 2026-11-03 | Agent 1 | Crear README.md base del projecte (context, rols, regles, bitàcola) | `main` | Fet |
| 2026-11-03 | Agent 1 | Convidar MiguelVico com a col·laborador amb permís d'escriptura | — | Fet |
| 2026-11-03 | Agent 1 | Configurar la protecció de la branca `main` (PR + 1 aprovació obligatòria) | `main` | Fet |
| 2026-11-03 | Agent 1 | Crear l'esquema inicial de `data/ghost_hosts.csv` amb 8 hosts d'exemple | `projecte/spectral-data` | Fet |
| 2026-11-03 | Agent 1 | Redactar el contracte de dades per a l'Agent 2 (`docs/contracte-dades.md`) | `projecte/spectral-data` | Fet |
| 2026-11-03 | Agent 1 | Documentar les troballes de la Fase 1 a la bitàcola | `projecte/spectral-data` | Fet |
| | Agent 2 (MiguelVico) | Crear `projecte/defense-script` i desenvolupar `scripts/exorcism.ps1` a partir del contracte de dades | `projecte/defense-script` | Pendent |
| | Agent 1 + Agent 2 | Mantenir `reports/dashboard.md` actualitzat amb l'estat de totes les branques | `feature/status-dashboard` | En curs |
