#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 7121bdf1facdd90d05b6994b4c2e5b2865a4638a
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 7121bdf1facdd90d05b6994b4c2e5b2865a4638a 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/printing/tests/test_latex.py
git checkout 7121bdf1facdd90d05b6994b4c2e5b2865a4638a 
