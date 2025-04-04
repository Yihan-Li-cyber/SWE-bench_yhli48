#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 51d37d1be95547059251076b3fadaa317750aab3
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 51d37d1be95547059251076b3fadaa317750aab3 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA xarray/tests/test_coarsen.py
git checkout 51d37d1be95547059251076b3fadaa317750aab3 
