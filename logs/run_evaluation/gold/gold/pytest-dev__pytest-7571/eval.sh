#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 422685d0bdc110547535036c1ff398b5e1c44145
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 422685d0bdc110547535036c1ff398b5e1c44145 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA testing/logging/test_fixture.py
git checkout 422685d0bdc110547535036c1ff398b5e1c44145 
