#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 58e78209c8577b9890e957b624466e5beed7eb08
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 58e78209c8577b9890e957b624466e5beed7eb08 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/matrices/expressions/tests/test_blockmatrix.py sympy/matrices/expressions/tests/test_matadd.py
git checkout 58e78209c8577b9890e957b624466e5beed7eb08 
