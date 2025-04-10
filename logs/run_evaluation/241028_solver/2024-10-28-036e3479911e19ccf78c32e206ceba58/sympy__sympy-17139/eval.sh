#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 1d3327b8e90a186df6972991963a5ae87053259d
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 1d3327b8e90a186df6972991963a5ae87053259d 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/simplify/tests/test_fu.py sympy/simplify/tests/test_simplify.py
git checkout 1d3327b8e90a186df6972991963a5ae87053259d 
