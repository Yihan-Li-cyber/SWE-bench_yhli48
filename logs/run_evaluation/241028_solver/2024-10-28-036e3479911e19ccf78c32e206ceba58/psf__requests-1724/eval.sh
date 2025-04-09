#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 1ba83c47ce7b177efe90d5f51f7760680f72eda0
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install .
git checkout 1ba83c47ce7b177efe90d5f51f7760680f72eda0 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA test_requests.py
git checkout 1ba83c47ce7b177efe90d5f51f7760680f72eda0 
