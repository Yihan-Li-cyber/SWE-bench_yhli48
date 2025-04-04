#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 5e7f1ab4bf58e473e5d7f878eb2b499d7deabd29
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 5e7f1ab4bf58e473e5d7f878eb2b499d7deabd29 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA testing/test_setuponly.py
git checkout 5e7f1ab4bf58e473e5d7f878eb2b499d7deabd29 
