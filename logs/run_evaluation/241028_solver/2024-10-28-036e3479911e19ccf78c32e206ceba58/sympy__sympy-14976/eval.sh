#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 9cbea134220b0b951587e11b63e2c832c7246cbc
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 9cbea134220b0b951587e11b63e2c832c7246cbc 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/printing/tests/test_pycode.py sympy/solvers/tests/test_numeric.py
git checkout 9cbea134220b0b951587e11b63e2c832c7246cbc 
