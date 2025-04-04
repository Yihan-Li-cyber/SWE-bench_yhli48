#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 1923822ddf8265199dbd9ef9ce09641d3fd042b9
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 1923822ddf8265199dbd9ef9ce09641d3fd042b9 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/solvers/tests/test_diophantine.py
git checkout 1923822ddf8265199dbd9ef9ce09641d3fd042b9 
