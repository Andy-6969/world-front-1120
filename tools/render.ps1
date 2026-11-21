# Renders src/front.html to entry.png (1024x1024) with headless Chrome.
# Chrome draws at 2x for crisp text; tools/shrink.py downsamples back to 1024 and writes the final PNG.
param([string]$Out = "entry.png")
$ErrorActionPreference = "Continue"  # Chrome logs harmless registry noise on stderr
$root = Split-Path -Parent $PSScriptRoot
$chrome = "C:\Program Files\Google\Chrome\Application\chrome.exe"
$html = (Resolve-Path (Join-Path $root "src\front.html")).Path
$big = Join-Path $root "out\render-2x.png"
New-Item -ItemType Directory -Force (Join-Path $root "out") | Out-Null
$profileDir = Join-Path $env:TEMP "wf1120-chrome"
& $chrome --headless=new --disable-gpu --hide-scrollbars --no-first-run "--user-data-dir=$profileDir" `
  --force-device-scale-factor=2 --window-size=1024,1024 --virtual-time-budget=3000 `
  "--screenshot=$big" ("file:///" + ($html -replace '\\','/')) 2>$null | Out-Null
python (Join-Path $root "tools\shrink.py") $big (Join-Path $root $Out)
