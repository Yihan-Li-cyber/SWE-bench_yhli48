#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff d4e0231b08147337745dcf601e62de7eefe2fb2d
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout d4e0231b08147337745dcf601e62de7eefe2fb2d 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/simplify/tests/test_sqrtdenest.py
git checkout d4e0231b08147337745dcf601e62de7eefe2fb2d 
