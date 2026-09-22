# Project Agent Instructions

This repository is an open-source office agent skills project.

## Goals

Use the skills in `./skills/*` to help an agent:
- create Word documents
- create Excel spreadsheets
- create PowerPoint decks
- create and manipulate PDFs
- validate generated office files before declaring success

## Required workflow

When generating office artifacts:

1. Use the correct skill for the output file type.
2. Prefer local project scripts and Python virtual environments.
3. Validate output with render or structure checks when applicable.
4. Do not claim success until the file exists and the validation step passes.
5. Save outputs in a project-local output directory such as `outputs/`.

## Skill routing

- `.docx` or `.dotx`: use `skills/office-docx`
- `.xlsx` / `.xlsm`: use `skills/office-xlsx`
- `.pptx` / `.potx`: use `skills/office-pptx`
- `.pdf`: use `skills/office-pdf`

## Environment rules

Prefer this project-local Python environment:

- Linux/macOS: `.venv/bin/python`
- Windows: `.venv\Scripts\python.exe`

Use the repository scripts for setup and validation.

## Validation requirement

For spreadsheets, formulas should be recalculated when possible.
For presentations and documents, convert to PDF or render to image when relevant.

Do not skip validation simply because generation succeeds.

## Output directory

Use a folder like:

```text
outputs/<project-name>/
```

Keep generated artifacts separate from source files.
