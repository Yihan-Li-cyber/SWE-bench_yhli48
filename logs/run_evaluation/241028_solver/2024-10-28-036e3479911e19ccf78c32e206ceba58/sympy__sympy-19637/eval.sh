#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 63f8f465d48559fecb4e4bf3c48b75bf15a3e0ef
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 63f8f465d48559fecb4e4bf3c48b75bf15a3e0ef 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/core/tests/test_sympify.py
git checkout 63f8f465d48559fecb4e4bf3c48b75bf15a3e0ef 
