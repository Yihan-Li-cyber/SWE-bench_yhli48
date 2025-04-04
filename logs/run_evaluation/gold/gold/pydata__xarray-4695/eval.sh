#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 51ef2a66c4e0896eab7d2b03e3dfb3963e338e3c
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 51ef2a66c4e0896eab7d2b03e3dfb3963e338e3c 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA xarray/tests/test_dataarray.py
git checkout 51ef2a66c4e0896eab7d2b03e3dfb3963e338e3c 
