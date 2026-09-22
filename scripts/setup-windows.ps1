$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

function Ensure-Command($name) {
    if (-not (Get-Command $name -ErrorAction SilentlyContinue)) {
        return $false
    }
    return $true
}

if (-not (Ensure-Command "python")) {
    Write-Host "Python is required. Install Python from python.org or winget."
    exit 1
}

if (-not (Test-Path ".\.venv")) {
    python -m venv .venv
}

. .\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
python -m pip install openpyxl python-docx pandas pypdf pdfplumber reportlab matplotlib weasyprint

if (Ensure-Command "winget") {
    $packages = @("LibreOffice", "Pandoc.Pandoc", "GnuWin32.Poppler")
    foreach ($pkg in $packages) {
        try {
            winget install --id $pkg --accept-source-agreements --accept-package-agreements --silent
        } catch {
            Write-Host "Failed to install package: $pkg"
        }
    }
} else {
    Write-Host "winget not found. Install LibreOffice, Pandoc, and Poppler manually if needed."
}

if (Ensure-Command "npm") {
    npm install docx pptxgenjs
} else {
    Write-Host "npm not found. Install Node.js for docx and pptxgenjs support."
}

Write-Host "Windows setup complete."
Write-Host "Use: .\.venv\Scripts\Activate.ps1"
