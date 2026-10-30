# verify.ps1 - App-Werkstatt Qualitaetstor (Claude Code Stop-Hook)
#
# Laeuft jedes Mal, wenn Claude eine Antwort beenden will.
#   Exit 0 = alles in Ordnung, Claude darf aufhoeren.
#   Exit 2 = Build oder Tests rot. Claude muss weiterarbeiten; der Grund geht ueber stderr an Claude.
# Geprueft wird nur, wenn sich der Code seit der letzten erfolgreichen Pruefung geaendert hat.
# Claude Code begrenzt aufeinanderfolgende Blockaden selbst, eine Endlosschleife entsteht nicht.
# Aenderungen an diesem Skript nur mit Andres Freigabe.

$ErrorActionPreference = 'Continue'

$root = $env:CLAUDE_PROJECT_DIR
if (-not $root) { $root = (Get-Location).Path }
Set-Location -LiteralPath $root

# Ohne Loesungsdatei gibt es noch nichts zu bauen (z. B. in den Phasen 2 und 3).
$loesung = @(Get-ChildItem -LiteralPath $root -File | Where-Object { $_.Extension -in @('.sln', '.slnx') })
if ($loesung.Count -eq 0) { exit 0 }

# Fingerabdruck des Code-Stands: Commit + Aenderungen gegenueber dem Commit + neue Dateien.
$spec = @('*.cs', '*.xaml', '*.csproj', '*.props', '*.targets', '*.sln', '*.slnx', '*.appxmanifest', '*.json')
$head = (& git rev-parse HEAD 2>$null) -join ''
$diff = (& git diff HEAD -- $spec 2>$null) -join "`n"
$neu = @(& git ls-files --others --exclude-standard -- $spec 2>$null)
$neuHash = ($neu | ForEach-Object { (& git hash-object -- $_ 2>$null) }) -join ','
$roh = "$head|$diff|$($neu -join ',')|$neuHash"

$sha = [System.Security.Cryptography.SHA256]::Create()
$hash = ([System.BitConverter]::ToString($sha.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($roh)))) -replace '-', ''

$marker = Join-Path $root '.claude\.last-verify'
if (Test-Path -LiteralPath $marker) {
    $letzter = ((Get-Content -LiteralPath $marker -Raw) -as [string])
    if ($letzter -and $letzter.Trim() -eq $hash) { exit 0 }
}

function Melde-Fehler {
    param([string]$Titel, [string]$Ausgabe)
    $zeilen = $Ausgabe -split "`r?`n"
    $auszug = @($zeilen | Where-Object { ($_ -match '(error|failed|Fehler)') -and ($_ -notmatch '\b0 Error') } | Select-Object -First 30)
    if ($auszug.Count -eq 0) { $auszug = @($zeilen | Select-Object -Last 30) }
    [Console]::Error.WriteLine("QUALITAETSTOR: $Titel")
    [Console]::Error.WriteLine('Behebe die Ursache. Keine Warnungen unterdruecken, keine Tests abschwaechen oder loeschen.')
    [Console]::Error.WriteLine('Laeuft die App noch (dotnet run)? Dann zuerst schliessen, sie blockiert den Build.')
    [Console]::Error.WriteLine(($auszug -join "`n"))
    exit 2
}

$build = (& dotnet build --nologo -warnaserror 2>&1 | Out-String)
if ($LASTEXITCODE -ne 0) { Melde-Fehler -Titel 'Build fehlgeschlagen.' -Ausgabe $build }

$test = (& dotnet test --nologo --no-build 2>&1 | Out-String)
if ($LASTEXITCODE -ne 0) { Melde-Fehler -Titel 'Tests fehlgeschlagen.' -Ausgabe $test }

Set-Content -LiteralPath $marker -Value $hash -NoNewline -Encoding ASCII
exit 0
