#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 193e3825645d93c73e31cdceb6d742cc6919624d
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 193e3825645d93c73e31cdceb6d742cc6919624d 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/polys/tests/test_rings.py
git checkout 193e3825645d93c73e31cdceb6d742cc6919624d 
