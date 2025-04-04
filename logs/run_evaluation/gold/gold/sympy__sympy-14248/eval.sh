#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 9986b38181cdd556a3f3411e553864f11912244e
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 9986b38181cdd556a3f3411e553864f11912244e 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/printing/pretty/tests/test_pretty.py sympy/printing/tests/test_ccode.py sympy/printing/tests/test_fcode.py sympy/printing/tests/test_jscode.py sympy/printing/tests/test_julia.py sympy/printing/tests/test_latex.py sympy/printing/tests/test_octave.py sympy/printing/tests/test_rcode.py sympy/printing/tests/test_str.py
git checkout 9986b38181cdd556a3f3411e553864f11912244e 
