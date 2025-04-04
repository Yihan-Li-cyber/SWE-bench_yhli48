#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 684a1d6aa0a6791e20078bc524f97c8906332390
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 684a1d6aa0a6791e20078bc524f97c8906332390 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA tests/test_self.py
git checkout 684a1d6aa0a6791e20078bc524f97c8906332390 
