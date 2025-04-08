#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff a7b7260bf06c20d408215d95ce20a1a01c12e5b1
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout a7b7260bf06c20d408215d95ce20a1a01c12e5b1 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_dates.py
git checkout a7b7260bf06c20d408215d95ce20a1a01c12e5b1 
