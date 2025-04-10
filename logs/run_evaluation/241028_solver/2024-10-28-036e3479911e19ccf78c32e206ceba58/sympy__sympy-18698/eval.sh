#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 3dff1b98a78f28c953ae2140b69356b8391e399c
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 3dff1b98a78f28c953ae2140b69356b8391e399c 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/polys/tests/test_polytools.py
git checkout 3dff1b98a78f28c953ae2140b69356b8391e399c 
