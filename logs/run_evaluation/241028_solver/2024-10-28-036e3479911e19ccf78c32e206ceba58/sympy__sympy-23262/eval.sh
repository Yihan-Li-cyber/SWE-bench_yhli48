#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff fdc707f73a65a429935c01532cd3970d3355eab6
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout fdc707f73a65a429935c01532cd3970d3355eab6 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/utilities/tests/test_lambdify.py
git checkout fdc707f73a65a429935c01532cd3970d3355eab6 
