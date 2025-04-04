#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 45c0a114e2b7b27b83c9618bc05b36afac82183c
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 45c0a114e2b7b27b83c9618bc05b36afac82183c 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA xarray/tests/test_dataarray.py xarray/tests/test_dataset.py xarray/tests/test_groupby.py
git checkout 45c0a114e2b7b27b83c9618bc05b36afac82183c 
