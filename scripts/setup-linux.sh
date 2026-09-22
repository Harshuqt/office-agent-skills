#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

if ! command -v python3 >/dev/null 2>&1; then
  echo "Python 3 is required."
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

if command -v apt-get >/dev/null 2>&1; then
  sudo apt-get update
  sudo apt-get install -y \
    libreoffice \
    pandoc \
    poppler-utils \
    fonts-dejavu-core
fi

if command -v npm >/dev/null 2>&1; then
  npm install docx pptxgenjs
else
  echo "npm not found. Install Node.js if you want docx or pptxgenjs support."
fi

echo "Linux setup complete."
echo "Use: . .venv/bin/activate"
