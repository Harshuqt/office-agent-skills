# Office Agent Skills

Open-source Agent Skills and utilities for creating, editing, validating, and rendering Microsoft Office file formats with AI agents.

This project is designed for use with:
- Codex
- Antigravity
- Claude Code style skills workflow
- Any local agent that loads project-level `SKILL.md` files

The project currently covers:
- DOCX (Word)
- XLSX (Excel)
- PPTX (PowerPoint)
- PDF

## Why this project exists

This project provides a clean, reusable, publicly distributable starting point for building office-capable AI agent workflows without copying proprietary Anthropic or vendor-specific skill files.

It focuses on:
- cross-platform setup
- portable agent skill files
- Python + Node.js tooling
- validation and rendering workflows
- public commercial-friendly licensing

## License

This project is licensed under the Apache License, Version 2.0.

Commercial use is allowed subject to the license terms.

## Repository layout

```text
office-agent-skills/
├── README.md
├── AGENTS.md
├── LICENSE
├── .gitignore
├── skills/
│   ├── office-docx/
│   │   └── SKILL.md
│   ├── office-xlsx/
│   │   └── SKILL.md
│   ├── office-pptx/
│   │   └── SKILL.md
│   └── office-pdf/
│       └── SKILL.md
├── scripts/
│   ├── setup.py
│   ├── check-dependencies.py
│   ├── setup-linux.sh
│   ├── setup-macos.sh
│   ├── setup-windows.ps1
│   └── validate-office-file.py
├── examples/
│   └── office_report_demo.py
└── pyproject.toml
```

## Quick start

### Linux

```bash
git clone https://github.com/Harshuqt/office-agent-skills.git
cd office-agent-skills
./scripts/setup-linux.sh
```

### macOS

```bash
git clone https://github.com/Harshuqt/office-agent-skills.git
cd office-agent-skills
./scripts/setup-macos.sh
```

### Windows PowerShell

```powershell
git clone https://github.com/Harshuqt/office-agent-skills.git
cd office-agent-skills
Set-ExecutionPolicy -Scope Process Bypass
.\scripts\setup-windows.ps1
```

## Agent integration

For local agent systems, copy or link the required skill folders into a project-local skills directory:

```bash
mkdir -p .agents/skills
cp -R skills/* .agents/skills/
```

The included `AGENTS.md` file is a project-level instruction file for compatible agents.

## Skills included

### `skills/office-docx`
Handles Word document creation/editing workflows using Python and the `python-docx` / `docx` ecosystem.

### `skills/office-xlsx`
Handles spreadsheet generation, charting, formulas, formatting, and validation.

### `skills/office-pptx`
Handles presentation generation, slide layout, visual validation, and export workflows.

### `skills/office-pdf`
Handles PDF generation, text extraction, merge/split workflows, and report generation.

## Validation workflow

The project expects an operational pattern of:
1. generate file
2. inspect output
3. validate structure
4. render / convert when needed
5. fix issues and regenerate

This is important for office file formats because a file can be generated successfully yet still be broken or malformed.

## Dependencies overview

Core Python libraries include:
- openpyxl
- python-docx
- pandas
- pypdf
- pdfplumber
- reportlab
- matplotlib
- weasyprint

Node.js libraries include:
- docx
- pptxgenjs

System dependencies may include:
- LibreOffice (`soffice`)
- Pandoc
- Poppler (`pdftoppm`, `pdftotext`)
- fonts

## Notes

- This project is designed as an open source, portable office-skills starter kit.
- It is intentionally written from first principles and not copied from proprietary vendor skill implementations.
- If you plan to redistribute this project or embed it in a commercial product, review the third-party dependency licenses and keep the Apache-2.0 notices intact.

## Contribution

Contributions are welcome. Please keep the project portable, cross-platform, and validation-focused.

## Acknowledgements

This project is inspired by the idea of reusable agent skills for office-document generation, but it is an original public implementation designed for open-source distribution.
