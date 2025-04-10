#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 7c4e2ac83f7b4306296ff9b7b51aaf016e5ad614
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 7c4e2ac83f7b4306296ff9b7b51aaf016e5ad614 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA xarray/tests/test_variable.py
git checkout 7c4e2ac83f7b4306296ff9b7b51aaf016e5ad614 
