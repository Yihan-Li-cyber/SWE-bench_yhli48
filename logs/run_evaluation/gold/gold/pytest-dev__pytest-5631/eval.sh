#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff cb828ebe70b4fa35cd5f9a7ee024272237eab351
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout cb828ebe70b4fa35cd5f9a7ee024272237eab351 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA testing/python/integration.py
git checkout cb828ebe70b4fa35cd5f9a7ee024272237eab351 
