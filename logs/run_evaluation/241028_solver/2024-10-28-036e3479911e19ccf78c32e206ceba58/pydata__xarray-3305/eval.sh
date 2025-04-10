#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 69c7e01e5167a3137c285cb50d1978252bb8bcbf
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 69c7e01e5167a3137c285cb50d1978252bb8bcbf 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA xarray/tests/test_dataarray.py
git checkout 69c7e01e5167a3137c285cb50d1978252bb8bcbf 
