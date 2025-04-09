#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 5f7a3a74aab1625c2bb65f643197ee885e3da576
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install .
git checkout 5f7a3a74aab1625c2bb65f643197ee885e3da576 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA test_requests.py
git checkout 5f7a3a74aab1625c2bb65f643197ee885e3da576 
