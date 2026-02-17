#!/usr/bin/env bash
set -e

echo "checking virtual environment..."
if [[ ! -d ".venv" ]]; then
  echo "creating virtual environment..."
  python3 -m venv .venv
else
  echo "virtual environment already exists"
fi

# Activate venv
echo "activating virtual environment..."
source .venv/bin/activate

echo "upgrading pip..."
python3 -m pip install --upgrade pip

echo "checking pre-commit installation..."
if ! python3 -m pre_commit --version >/dev/null 2>&1; then
  echo "installing pre-commit..."
  python3 -m pip install pre-commit
else
  echo "pre-commit already installed in venv"
fi

echo "installing pre-commit hooks..."
python3 -m pre_commit install

echo "pre_commit setup complete."

echo "----------------------------------"
echo "To activate the virtual environment, run: source .venv/bin/activate"
echo "To deactivate, run: deactivate"
echo "----------------------------------"