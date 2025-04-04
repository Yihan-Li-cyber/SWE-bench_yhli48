#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 832c24fec1046eaa544a4cab4c69e3af3e651759
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 832c24fec1046eaa544a4cab4c69e3af3e651759 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/core/tests/test_symbol.py
git checkout 832c24fec1046eaa544a4cab4c69e3af3e651759 
