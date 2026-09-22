#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

if ! command -v python3 >/dev/null 2>&1; then
  echo "Install Python 3 from https://www.python.org/downloads/" >&2
  exit 1
fi

if command -v brew >/dev/null 2>&1; then
  brew install libreoffice pandoc poppler qpdf || true
else
  echo "Homebrew is recommended: https://brew.sh/"
  echo "Install LibreOffice, Pandoc, Poppler, and qpdf manually if they are unavailable."
fi

python3 scripts/setup.py
python3 scripts/check-dependencies.py
