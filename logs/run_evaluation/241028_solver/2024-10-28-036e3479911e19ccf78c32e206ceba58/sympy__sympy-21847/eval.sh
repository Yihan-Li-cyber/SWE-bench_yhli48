#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff d9b18c518d64d0ebe8e35a98c2fb519938b9b151
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout d9b18c518d64d0ebe8e35a98c2fb519938b9b151 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/polys/tests/test_monomials.py
git checkout d9b18c518d64d0ebe8e35a98c2fb519938b9b151 
