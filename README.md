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

### Agent 2 – Miquel Vico (projecte/defense-script)
- He explorat la branca remota `projecte/spectral-data` amb `git checkout
origin/projecte/spectral-data`.
- Pista trobada: `data/ghost_hosts.csv` té les columnes ID, Hostname, IP,
Tipus_Amenaca, Nivell_Risc i Estat, separades per comes i en UTF-8.
- Pista trobada: segons `docs/contracte-dades.md`, Nivell_Risc pot ser Baix,
Mitja, Alt o Critic.
- Decisió: l'script `scripts/exorcism.ps1` aïlla només els hosts amb risc Alt
o Critic.
- He provat l'script amb una còpia temporal del CSV i genera una regla de
bloqueig per a cada host crític.

### Fase 2

_(pendent d'omplir)_

### Fase 3

_(pendent d'omplir)_

## Registre de tasques per membre

- **Miquel Vico (Agent 2):** exploració de la branca de dades, script
d'aïllament `scripts/exorcism.ps1`, revisió de les Pull Requests de l'Agent
1.

| Data | Agent | Tasca | Branca/PR | Estat |
|---|---|---|---|---|
| | | | | |
