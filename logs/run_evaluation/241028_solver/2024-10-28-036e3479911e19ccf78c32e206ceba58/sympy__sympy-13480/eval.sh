#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff f57fe3f4b3f2cab225749e1b3b38ae1bf80b62f0
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout f57fe3f4b3f2cab225749e1b3b38ae1bf80b62f0 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/functions/elementary/tests/test_hyperbolic.py
git checkout f57fe3f4b3f2cab225749e1b3b38ae1bf80b62f0 
