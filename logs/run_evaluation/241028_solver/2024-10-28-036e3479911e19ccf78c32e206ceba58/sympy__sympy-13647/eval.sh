#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 67e3c956083d0128a621f65ee86a7dacd4f9f19f
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 67e3c956083d0128a621f65ee86a7dacd4f9f19f 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/matrices/tests/test_commonmatrix.py
git checkout 67e3c956083d0128a621f65ee86a7dacd4f9f19f 
