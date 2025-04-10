#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff d3b6aa6d8b997df115a53c001d00222a0f92f63a
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout d3b6aa6d8b997df115a53c001d00222a0f92f63a 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA xarray/tests/test_computation.py xarray/tests/test_units.py
git checkout d3b6aa6d8b997df115a53c001d00222a0f92f63a 
