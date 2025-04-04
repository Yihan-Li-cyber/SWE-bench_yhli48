#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff b1cb676cf92dd1a48365b731979833375b188bf2
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout b1cb676cf92dd1a48365b731979833375b188bf2 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/core/tests/test_numbers.py
git checkout b1cb676cf92dd1a48365b731979833375b188bf2 
