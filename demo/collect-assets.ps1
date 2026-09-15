<#
    Collects the demo assets from a local folder into this repo.

    Run this on the Windows machine that holds the DEMONSTRATION folder:

        cd <this repo>
        powershell -ExecutionPolicy Bypass -File demo\collect-assets.ps1

    It copies what it finds, reports what it cannot find, and never
    invents a substitute. Missing is a fine answer; wrong is not.
#>

param(
    [string]$Source = "$env:USERPROFILE\Downloads\DEMONSTRATION"
)

$ErrorActionPreference = 'Stop'
$repo = Split-Path -Parent $PSScriptRoot
$found = @()
$missing = @()

function Copy-First {
    param($Pattern, $Destination, $Label)

    $hit = Get-ChildItem -Path $Source -Filter $Pattern -File -ErrorAction SilentlyContinue |
           Sort-Object Length -Descending | Select-Object -First 1

    if ($null -eq $hit) {
        $script:missing += "$Label  (no match for '$Pattern')"
        return
    }

    $target = Join-Path $repo $Destination
    New-Item -ItemType Directory -Force -Path (Split-Path $target) | Out-Null
    Copy-Item $hit.FullName $target -Force
    $script:found += "{0,-34} {1,10:N0} bytes  <- {2}" -f $Destination, $hit.Length, $hit.Name
}

if (-not (Test-Path $Source)) {
    Write-Host "Source folder not found: $Source" -ForegroundColor Red
    Write-Host "Pass the right one with:  -Source 'C:\path\to\folder'"
    exit 1
}

Write-Host "Reading from: $Source`n"

Copy-First "PROMPT A*.md"   "prompts\originals\PROMPT-A-build.md" "Prompt A (build)"
Copy-First "PROMPT B*.md"   "prompts\originals\PROMPT-B-edit.md"  "Prompt B (edit)"
Copy-First "SETUP NOTE*.pdf" "demo\SETUP-NOTE.pdf"                "Setup note PDF"
Copy-First "*.csv"          "demo\sample-data.csv"                "Sample dataset CSV"

# .pbix only if small enough for git to be sensible about it
$pbix = Get-ChildItem -Path $Source -Filter "*.pbix" -File -ErrorAction SilentlyContinue |
        Sort-Object Length -Descending | Select-Object -First 1
if ($null -eq $pbix) {
    $missing += "Power BI file  (no match for '*.pbix')"
} elseif ($pbix.Length -gt 50MB) {
    $missing += ("Power BI file  (found '{0}' but it is {1:N0} bytes, over the 50 MB git limit - upload it to shared storage instead)" -f $pbix.Name, $pbix.Length)
} else {
    Copy-Item $pbix.FullName (Join-Path $repo "demo\FSG-Fleet-Demo.pbix") -Force
    $found += "{0,-34} {1,10:N0} bytes  <- {2}" -f "demo\FSG-Fleet-Demo.pbix", $pbix.Length, $pbix.Name
}

Write-Host "COPIED:" -ForegroundColor Green
if ($found.Count) { $found | ForEach-Object { Write-Host "  $_" } } else { Write-Host "  nothing" }

Write-Host "`nNOT FOUND:" -ForegroundColor Yellow
if ($missing.Count) { $missing | ForEach-Object { Write-Host "  $_" } } else { Write-Host "  nothing - everything was located" }

$mp4 = Get-ChildItem -Path $Source -Filter "*.mp4" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($mp4) {
    Write-Host ("`nSKIPPED ON PURPOSE: {0} ({1:N0} bytes)" -f $mp4.Name, $mp4.Length) -ForegroundColor Cyan
    Write-Host "  Video does not belong in git. Upload it to shared storage and put"
    Write-Host "  the link in prompts\ASSETS.md."
}

Write-Host "`nNext:"
Write-Host "  git add -A"
Write-Host "  git commit -m 'Add original demo prompts and setup note'"
Write-Host "  git push"
