#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff c0e85160406f9bf2bcaa2992138587668a1cd0bc
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout c0e85160406f9bf2bcaa2992138587668a1cd0bc 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/polys/tests/test_polytools.py
git checkout c0e85160406f9bf2bcaa2992138587668a1cd0bc 
