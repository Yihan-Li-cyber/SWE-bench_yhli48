#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 37522e991a32ee3c0ad1a5ff8afe8e3eb1885550
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 37522e991a32ee3c0ad1a5ff8afe8e3eb1885550 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA xarray/tests/test_coding.py
git checkout 37522e991a32ee3c0ad1a5ff8afe8e3eb1885550 
