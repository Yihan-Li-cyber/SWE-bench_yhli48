#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff d1320814eda6549996190618a21eaf212cfd4d1e
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout d1320814eda6549996190618a21eaf212cfd4d1e 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/core/tests/test_basic.py sympy/core/tests/test_numbers.py
git checkout d1320814eda6549996190618a21eaf212cfd4d1e 
