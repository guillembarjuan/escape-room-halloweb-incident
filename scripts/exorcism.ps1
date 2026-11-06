<#
exorcism.ps1 - Script d'aillament de xarxa (v2)
Agent 2 (Scripting/Logica) - Escape Room: The Halloweb Incident
Aplica l'aillament als hosts amb Nivell_Risc Alt o Critic que entren per un port critic.
Els ports no critics es descarten (Issue d'emergencia: canvi de vector d'atac).
NOTA: es una simulacio, no modifica la configuracio de xarxa.
#>
param(
[string]$RutaCsv = "data/ghost_hosts.csv"
)
if (-not (Test-Path $RutaCsv)) {
Write-Host "ERROR: no s'ha trobat el fitxer $RutaCsv" -ForegroundColor Red
exit 1
}
$hosts = Import-Csv -Path $RutaCsv -Encoding UTF8
$nivellsCritics = @("Alt", "Critic")
$portsCritics = @(22, 445, 3306, 3389)
$aillar = $hosts | Where-Object {
($nivellsCritics -contains $_.Nivell_Risc) -and ($portsCritics -contains [int]$_.Port_Infectat)
}
$descartats = $hosts | Where-Object { -not ($portsCritics -contains [int]$_.Port_Infectat) }
Write-Host "=== EXORCISME DE XARXA (protocol Port_Infectat) ===" -ForegroundColor Magenta
Write-Host "Hosts analitzats: $($hosts.Count)"
Write-Host "Descartats (port no critic): $($descartats.Count)"
Write-Host "Hosts a aillar: $($aillar.Count)"
Write-Host ""
foreach ($h in $aillar) {
$info = "$($h.Hostname) ($($h.IP)) - Port $($h.Port_Infectat) - Risc $($h.Nivell_Risc)"
Write-Host "[AILLANT] $info" -ForegroundColor Yellow
$regla = "New-NetFirewallRule -DisplayName 'Exorcisme-$($h.ID)' -Direction Inbound"
$regla += " -RemoteAddress $($h.IP) -LocalPort $($h.Port_Infectat) -Action Block"
Write-Host " Simulacio: $regla"
}
Write-Host ""
Write-Host "Exorcisme completat." -ForegroundColor Green