#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff d7c3045115693e887bcd03599b7ca4650ac5f2cb
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout d7c3045115693e887bcd03599b7ca4650ac5f2cb 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/utilities/tests/test_lambdify.py
git checkout d7c3045115693e887bcd03599b7ca4650ac5f2cb 
