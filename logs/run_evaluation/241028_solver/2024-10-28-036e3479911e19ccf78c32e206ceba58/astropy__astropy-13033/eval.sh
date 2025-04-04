#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 298ccb478e6bf092953bca67a3d29dc6c35f6752
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test] --verbose
git checkout 298ccb478e6bf092953bca67a3d29dc6c35f6752 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA astropy/timeseries/tests/test_sampled.py
git checkout 298ccb478e6bf092953bca67a3d29dc6c35f6752 
