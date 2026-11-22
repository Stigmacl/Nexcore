<#
  verificar-nexcore.ps1 — Revisa qué cambió NexCore en tu PC. SOLO LEE: no cambia nada.

  Cómo usarlo (PowerShell, sin permisos especiales):
    powershell -ExecutionPolicy Bypass -File .\verificar-nexcore.ps1
    powershell -ExecutionPolicy Bypass -File .\verificar-nexcore.ps1 -Exe "C:\ruta\NexCore.exe"

  Qué revisa:
    1. Si tu NexCore.exe es idéntico al publicado (huella SHA-256 contra la página oficial).
    2. Cada ajuste que aplicaste con NexCore: qué valor tenía antes (lo que guarda para «Deshacer») y qué valor tiene ahora.
    3. Si NexCore abre con Windows y qué tareas programadas suyas existen.
  Este script es público y legible: puedes leer cada línea antes de ejecutarlo.
#>
param([string]$Exe)

$ErrorActionPreference = 'SilentlyContinue'
$carpeta = Join-Path $env:APPDATA 'NexCore'
$repo = 'https://raw.githubusercontent.com/Stigmacl/Nexcore/main'

function Titulo($t) { Write-Host ''; Write-Host "== $t ==" -ForegroundColor Cyan }

# ---------- 1. El archivo NexCore.exe ----------
Titulo 'Tu NexCore.exe'
if (-not $Exe) {
    $proceso = Get-Process NexCore -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($proceso -and $proceso.Path) { $Exe = $proceso.Path }
}
if ($Exe -and (Test-Path $Exe)) {
    $huella = (Get-FileHash $Exe -Algorithm SHA256).Hash.ToLower()
    $version = (Get-Item $Exe).VersionInfo.ProductVersion -replace '\+.*$', ''
    Write-Host "Archivo:  $Exe"
    Write-Host "Versión:  $version"
    Write-Host "SHA-256:  $huella"
    try {
        $oficial = Invoke-RestMethod 'https://nexcore.tacticalopschile.cl/version.json' -TimeoutSec 15
        if ($oficial.sha256 -eq $huella) { Write-Host "OK: es idéntico al publicado (versión $($oficial.version))." -ForegroundColor Green }
        elseif ($oficial.version -ne $version) { Write-Host "Tu versión ($version) no es la última ($($oficial.version)). Compara su huella en VERSIONES.md del repositorio." -ForegroundColor Yellow }
        else { Write-Host 'ATENCIÓN: la huella NO coincide con la publicada. Descárgalo de nuevo desde la página oficial.' -ForegroundColor Red }
    } catch { Write-Host 'No se pudo consultar la página oficial (¿sin internet?). Compara la huella a mano en VERSIONES.md.' -ForegroundColor Yellow }
} else {
    Write-Host 'No se encontró NexCore.exe abierto. Ábrelo o usa:  -Exe "ruta\NexCore.exe"' -ForegroundColor Yellow
}

# ---------- 2. Ajustes aplicados ----------
Titulo 'Ajustes que aplicaste con NexCore'
$nombres = @{}
try { (Invoke-RestMethod "$repo/ajustes.json" -TimeoutSec 15).ajustes | ForEach-Object { $nombres[$_.id] = $_.nombre } } catch { }
$archivo = Join-Path $carpeta 'respaldo.json'
if (-not (Test-Path $archivo)) {
    Write-Host 'No hay ajustes aplicados (no existe respaldo.json).' -ForegroundColor Green
} else {
    $respaldo = Get-Content $archivo -Raw -Encoding UTF8 | ConvertFrom-Json
    $total = 0
    foreach ($ajuste in $respaldo.PSObject.Properties) {
        $total++
        $nombre = if ($nombres[$ajuste.Name]) { $nombres[$ajuste.Name] } else { $ajuste.Name }
        Write-Host ''
        Write-Host "* $nombre" -ForegroundColor White -NoNewline; Write-Host "  [$($ajuste.Name)]" -ForegroundColor DarkGray
        foreach ($v in $ajuste.Value) {
            if ($v.Nombre -eq 'servicio') { Write-Host "    Servicio $($v.Ruta): antes estaba «$($v.Texto)»"; continue }
            if ($v.Nombre -eq 'propio') { Write-Host "    Acción propia (ver AJUSTES.md). Valor guardado para deshacer: $($v.Texto)"; continue }
            $colmena = if ($v.Colmena -eq 1) { 'HKLM' } else { 'HKCU' }
            $actual = (Get-ItemProperty -Path "Registry::$colmena\$($v.Ruta)" -Name $v.Nombre -ErrorAction SilentlyContinue).($v.Nombre)
            $antes = if ($v.Existia) { if ($null -ne $v.Texto) { $v.Texto } else { $v.Numero } } else { '(no existía)' }
            if ($null -eq $actual) { $actual = '(no existe)' }
            Write-Host "    $colmena\$($v.Ruta) → $($v.Nombre): antes $antes · ahora $actual"
        }
    }
    Write-Host ''
    Write-Host "$total ajustes con respaldo. Cada uno se puede deshacer desde NexCore → Optimización → Historial." -ForegroundColor Green
}

# ---------- 3. Inicio con Windows y tareas ----------
Titulo 'Inicio con Windows y tareas programadas'
$run = Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run' -ErrorAction SilentlyContinue
$entrada = $run.PSObject.Properties | Where-Object { $_.Name -like 'NexCore*' }
if ($entrada) { Write-Host "Abre con Windows: $($entrada.Value)  (se apaga en NexCore → Ajustes)" } else { Write-Host 'No abre con Windows.' }
$tareas = Get-ScheduledTask -ErrorAction SilentlyContinue | Where-Object { $_.TaskName -like 'NexCore*' }
if ($tareas) { $tareas | ForEach-Object { Write-Host "Tarea: $($_.TaskName) · $($_.State)" } } else { Write-Host 'No hay tareas programadas de NexCore.' }

Titulo 'Listo'
Write-Host 'Este script no cambió nada en tu equipo. Dudas o reportes: https://github.com/Stigmacl/Nexcore/issues'
