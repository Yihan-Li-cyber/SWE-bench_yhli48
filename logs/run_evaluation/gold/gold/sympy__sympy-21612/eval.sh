#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff b4777fdcef467b7132c055f8ac2c9a5059e6a145
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout b4777fdcef467b7132c055f8ac2c9a5059e6a145 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/printing/tests/test_str.py
git checkout b4777fdcef467b7132c055f8ac2c9a5059e6a145 
