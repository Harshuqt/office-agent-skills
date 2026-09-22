# Office Agent Skills

A cross-platform, open-source Agent Skills toolkit for creating, inspecting, rendering, and validating DOCX, XLSX, PPTX, and PDF files.

Designed for Codex, Antigravity, Claude Code-style skill loaders, and compatible local agents.

## Features

- Original, vendor-neutral `SKILL.md` instructions
- Linux, macOS, and Windows setup
- Python and Node.js document tooling
- DOCX, XLSX, PPTX, and PDF workflows
- Basic structural validation
- Example generators
- Apache-2.0 project license

This project does not copy proprietary vendor skill files. It provides independent workflows around separately licensed libraries and external applications.

## Install

### Linux

```bash
./scripts/setup-linux.sh
```

### macOS

```bash
./scripts/setup-macos.sh
```

### Windows PowerShell

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\scripts\setup-windows.ps1
```

All setup scripts create `.venv`, install Python dependencies, and attempt to install or detect system tools. Review the output and install missing optional tools manually.

## Use with an agent

Copy the skills into your project:

```bash
mkdir -p .agents/skills
cp -R skills/* .agents/skills/
```

On Windows PowerShell:

```powershell
New-Item -ItemType Directory -Force .agents\skills | Out-Null
Copy-Item -Recurse skills\* .agents\skills\
```

Then instruct your agent to use the matching skill whenever the corresponding file type is involved.

## Try the examples

```bash
# Linux/macOS
. .venv/bin/activate
python examples/office_report_demo.py --output-dir outputs/demo
python scripts/validate-office-file.py outputs/demo/report.docx
python scripts/validate-office-file.py outputs/demo/report.xlsx
python scripts/validate-office-file.py outputs/demo/report.pdf

# Windows
. .venv\Scripts\Activate.ps1
python examples/office_report_demo.py --output-dir outputs/demo
```

For presentations, if Node.js dependencies are installed:

```bash
node examples/presentation_demo.js outputs/demo/report.pptx
python scripts/validate-office-file.py outputs/demo/report.pptx
```

## Tool map

| Format | Primary tools | Optional rendering/validation |
|---|---|---|
| DOCX | `python-docx`, `docx` | LibreOffice, Pandoc |
| XLSX | `openpyxl`, `pandas` | LibreOffice |
| PPTX | `pptxgenjs` | LibreOffice, Poppler |
| PDF | `pypdf`, `pdfplumber`, ReportLab, WeasyPrint | qpdf, Poppler |

## MCP

This repository is skills-first. It does not require MCP. A future MCP adapter can safely call the same scripts and libraries. Keep MCP as a thin, permission-controlled interface rather than exposing arbitrary shell execution.

## Licensing

The original project code and skill instructions are Apache-2.0 licensed. Third-party libraries and optional external applications retain their own licenses. See `NOTICE` and `THIRD_PARTY_LICENSES/`.

This is software documentation, not legal advice. Review dependency licenses before redistributing bundled binaries.
