#!/usr/bin/env python3
import os
import platform
import shutil
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
VENV = ROOT / ".venv"
PYTHON = sys.executable


def run(cmd, cwd=None, env=None):
    print(f"$ {' '.join(cmd)}")
    subprocess.run(cmd, cwd=cwd, env=env, check=True)


def detect_python():
    candidates = [
        shutil.which("python3"),
        shutil.which("python"),
        PYTHON,
    ]
    for c in candidates:
        if c:
            return c
    raise RuntimeError("No Python interpreter found on PATH.")


def ensure_venv(python_bin):
    if not VENV.exists():
        run([python_bin, "-m", "venv", str(VENV)])


def venv_python():
    if platform.system() == "Windows":
        return VENV / "Scripts" / "python.exe"
    return VENV / "bin" / "python"


def install_requirements():
    py = str(venv_python())
    run([py, "-m", "pip", "install", "--upgrade", "pip"])

    requirements = [
        "openpyxl",
        "python-docx",
        "pandas",
        "pypdf",
        "pdfplumber",
        "reportlab",
        "matplotlib",
        "weasyprint",
    ]
    run([py, "-m", "pip", "install", *requirements])


def ensure_node_packages():
    if shutil.which("npm") is None:
        print("Node.js/npm not found on PATH. Install Node.js if you plan to use docx or pptxgenjs.")
        return

    run(["npm", "install", "docx", "pptxgenjs"], cwd=str(ROOT))


def main():
    print("Preparing project environment for office-agent-skills")
    py = detect_python()
    ensure_venv(py)
    install_requirements()
    ensure_node_packages()
    print("Environment ready.")
    print(f"Python: {venv_python()}")


if __name__ == "__main__":
    try:
        main()
    except subprocess.CalledProcessError as exc:
        print(f"Setup failed with exit code {exc.returncode}")
        sys.exit(exc.returncode)
