#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 1d1619ef913b99b06647d2030bddff4800abdf63
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 1d1619ef913b99b06647d2030bddff4800abdf63 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA tests/lint/unittest_lint.py
git checkout 1d1619ef913b99b06647d2030bddff4800abdf63 
