#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 6091437be9776139d3672cde28a19cbe6c09dcd5
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 6091437be9776139d3672cde28a19cbe6c09dcd5 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_contour.py
git checkout 6091437be9776139d3672cde28a19cbe6c09dcd5 
