#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff c4e836cdf73fc6aa7bab6a86719a0f08861ffb1d
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout c4e836cdf73fc6aa7bab6a86719a0f08861ffb1d 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/printing/tests/test_pycode.py
git checkout c4e836cdf73fc6aa7bab6a86719a0f08861ffb1d 
