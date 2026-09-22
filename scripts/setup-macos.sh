#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

if command -v brew >/dev/null 2>&1; then
  echo "Homebrew detected. Installing with Homebrew-compatible tools where needed."
fi

if ! command -v python3 >/dev/null 2>&1; then
  echo "Python 3 is required. Install Python first."
  exit 1
fi

python3 -m venv .venv
. .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install \
  openpyxl \
  python-docx \
  pandas \
  pypdf \
  pdfplumber \
  reportlab \
  matplotlib \
  weasyprint

if command -v brew >/dev/null 2>&1; then
  brew install libreoffice pandoc poppler
else
  if command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y \
      libreoffice \
      pandoc \
      poppler-utils \
      fonts-dejavu-core
  else
    echo "No supported package manager found. Install LibreOffice, Pandoc, and Poppler manually."
  fi
fi

if command -v npm >/dev/null 2>&1; then
  npm install docx pptxgenjs
else
  echo "Node.js/npm not found; install Node.js for docx and pptxgenjs support."
fi

echo "macOS setup complete."
echo "Use: . .venv/bin/activate"
