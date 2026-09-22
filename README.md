# Office Agent Skills

A cross-platform, open-source Agent Skills toolkit for creating, inspecting, rendering, validating, styling, and populating authorized templates for DOCX, XLSX, PPTX, and PDF files.

## Choose a generation mode

- **Scratch:** create a new document using `styles/default.json` or another theme.
- **Template:** populate a user-owned branded template using explicit placeholders or mappings.
- **Edit:** modify selected regions without rebuilding unrelated content.

See [docs/TEMPLATES.md](docs/TEMPLATES.md) and `skills/office-branding/SKILL.md`.

## Install

```bash
# Linux
./scripts/setup-linux.sh

# macOS
./scripts/setup-macos.sh

# Windows PowerShell
Set-ExecutionPolicy -Scope Process Bypass
.\scripts\setup-windows.ps1
```

## Agent integration

Copy the skills to a compatible project:

```bash
mkdir -p .agents/skills
cp -R skills/* .agents/skills/
```

The skills include `office-docx`, `office-xlsx`, `office-pptx`, `office-pdf`, and `office-branding`.

## Template examples

DOCX:

```bash
.venv/bin/python scripts/replace-docx-placeholders.py \
  templates/report.docx outputs/report.docx \
  --value company_name="Example Corporation"
```

XLSX:

```bash
.venv/bin/python scripts/populate-xlsx-template.py \
  templates/budget.xlsx data.json outputs/budget.xlsx
```

Always validate and render populated documents before delivery.

## License

Original project code and skill instructions are Apache-2.0 licensed. Third-party libraries and optional external applications retain their own licenses. Do not add templates or brand assets unless you have permission to redistribute them.
