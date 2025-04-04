#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 3f8c8c2377cb8e0daaf8073e8d03ac7d87580813
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 3f8c8c2377cb8e0daaf8073e8d03ac7d87580813 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/codegen/tests/test_rewriting.py sympy/printing/tests/test_pycode.py sympy/utilities/tests/test_lambdify.py
git checkout 3f8c8c2377cb8e0daaf8073e8d03ac7d87580813 
