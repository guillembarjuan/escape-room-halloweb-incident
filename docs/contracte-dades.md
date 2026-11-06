# Contracte de dades — `data/ghost_hosts.csv`

Aquest document defineix el "contracte" que ha de complir el fitxer `data/ghost_hosts.csv` perquè l'Agent 2 (Scripting) pugui construir l'script `scripts/exorcism.ps1` amb la certesa de com llegir-lo i interpretar-lo. Qualsevol canvi en l'estructura del fitxer s'ha de reflectir primer en aquest contracte.

## Format general del fitxer

- **Separador de camps:** coma (`,`)
- **Codificació:** UTF-8 (sense BOM)
- **Capçalera:** primera línia amb el nom exacte de les columnes
- **Final de línia:** LF o CRLF (indiferent per a `Import-Csv`)
- **Un registre per línia**, sense línies en blanc intermèdies

## Esquema de columnes

| Columna | Tipus | Format | Valors permesos / exemple |
|---|---|---|---|
| `ID` | Text (identificador) | `GH-NNN` (3 dígits amb zeros a l'esquerra) | `GH-001`, `GH-002`, ... (únic per fila) |
| `Hostname` | Text | nom de màquina en minúscules, sense espais | `phantom-web01` |
| `IP` | Text (IPv4) | `N.N.N.N` | `10.0.12.14` |
| `Tipus_Amenaca` | Text (categoria) | paraula/frase amb guions baixos, sense espais | `Backdoor`, `Trafic_C2`, `Ransomware`, `Phishing`, `Forca_Bruta`, `Acces_No_Autoritzat`, `Enverinament_DNS`, `Exfiltracio_Dades` (llista oberta a noves categories) |
| `Nivell_Risc` | Text (enumeració ordenada) | un dels 4 valors següents | `Baix` / `Mitja` / `Alt` / `Critic` |
| `Estat` | Text (enumeració) | un dels valors següents | `Actiu` / `En_Observacio` / `Aillat` / `Resolt` |

> **Important:** aquesta versió del fitxer **no inclou cap columna de ports** (p. ex. `Port_Infectat`). Si en una fase posterior s'afegeix, es documentarà aquí abans de ser consumida per l'script.

## Ordre de severitat de `Nivell_Risc`

Per a qualsevol lògica de comparació o ordenació a l'script:

```
Baix < Mitja < Alt < Critic
```

## Exemple de lectura des de PowerShell

```powershell
# Llegeix el CSV respectant la codificació UTF-8
$hosts = Import-Csv -Path ".\data\ghost_hosts.csv" -Encoding UTF8

# Filtra només els hosts actius amb risc Critic
$hosts | Where-Object { $_.Estat -eq "Actiu" -and $_.Nivell_Risc -eq "Critic" }

# Recorre tots els registres
foreach ($h in $hosts) {
    Write-Host "$($h.ID) - $($h.Hostname) ($($h.IP)): $($h.Tipus_Amenaca) [$($h.Nivell_Risc)/$($h.Estat)]"
}
```

## Validacions recomanades abans de processar

1. Comprovar que la capçalera coincideix exactament amb `ID,Hostname,IP,Tipus_Amenaca,Nivell_Risc,Estat`.
2. Comprovar que `Nivell_Risc` i `Estat` només contenen els valors enumerats més amunt.
3. Comprovar que `IP` té format IPv4 vàlid.
4. No assumir cap columna addicional (com ports) fins que aquest contracte s'actualitzi.

## Referència

Dades font: `data/ghost_hosts.csv` (branca `projecte/spectral-data`).

## Actualització de protocol (Issue #5)
- **Port_Infectat**: enter, port pel qual entra l'amenaça.
- **Ports crítics** (l'script els aïlla): 22 (SSH), 445 (SMB), 3306 (MySQL), 3389 (RDP)
- Qualsevol altre port es considera **no crític** i l'script el descarta.