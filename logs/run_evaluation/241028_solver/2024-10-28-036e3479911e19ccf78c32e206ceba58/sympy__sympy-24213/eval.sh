#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff e8c22f6eac7314be8d92590bfff92ced79ee03e2
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout e8c22f6eac7314be8d92590bfff92ced79ee03e2 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/physics/units/tests/test_quantities.py
git checkout e8c22f6eac7314be8d92590bfff92ced79ee03e2 
