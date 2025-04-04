#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 19b088636eb7d3f65ab7a1046ac672e0689371d8
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 19b088636eb7d3f65ab7a1046ac672e0689371d8 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA xarray/tests/test_weighted.py
git checkout 19b088636eb7d3f65ab7a1046ac672e0689371d8 
