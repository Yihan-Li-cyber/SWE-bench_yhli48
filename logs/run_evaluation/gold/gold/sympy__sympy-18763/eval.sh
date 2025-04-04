#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 70381f282f2d9d039da860e391fe51649df2779d
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 70381f282f2d9d039da860e391fe51649df2779d 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/printing/tests/test_latex.py
git checkout 70381f282f2d9d039da860e391fe51649df2779d 
