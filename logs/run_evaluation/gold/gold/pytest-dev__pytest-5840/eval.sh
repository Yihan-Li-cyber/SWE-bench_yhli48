#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 73c5b7f4b11a81e971f7d1bb18072e06a87060f4
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 73c5b7f4b11a81e971f7d1bb18072e06a87060f4 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA testing/test_conftest.py
git checkout 73c5b7f4b11a81e971f7d1bb18072e06a87060f4 
