#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 41d211c24a6781843b174379d6d6538f5c17adb9
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 41d211c24a6781843b174379d6d6538f5c17adb9 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA testing/test_capture.py
git checkout 41d211c24a6781843b174379d6d6538f5c17adb9 
