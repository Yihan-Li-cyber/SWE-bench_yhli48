#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 3c1534944cbd34e8a41bc9e76818018fadefc9a1
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 3c1534944cbd34e8a41bc9e76818018fadefc9a1 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA testing/test_mark.py
git checkout 3c1534944cbd34e8a41bc9e76818018fadefc9a1 
