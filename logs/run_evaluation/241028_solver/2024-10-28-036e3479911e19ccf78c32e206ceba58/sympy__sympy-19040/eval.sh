#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff b9179e80d2daa1bb6cba1ffe35ca9e6612e115c9
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout b9179e80d2daa1bb6cba1ffe35ca9e6612e115c9 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/polys/tests/test_polytools.py
git checkout b9179e80d2daa1bb6cba1ffe35ca9e6612e115c9 
