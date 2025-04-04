#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 851dadeb0338403e5021c3fbe80cbc9127ee672d
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 851dadeb0338403e5021c3fbe80cbc9127ee672d 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA xarray/tests/test_computation.py
git checkout 851dadeb0338403e5021c3fbe80cbc9127ee672d 
