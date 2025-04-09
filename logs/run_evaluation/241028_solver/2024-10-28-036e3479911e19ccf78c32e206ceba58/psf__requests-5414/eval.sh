#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 39d0fdd9096f7dceccbc8f82e1eda7dd64717a8e
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install .
git checkout 39d0fdd9096f7dceccbc8f82e1eda7dd64717a8e 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA tests/test_requests.py
git checkout 39d0fdd9096f7dceccbc8f82e1eda7dd64717a8e 
