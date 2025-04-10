#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 30379ea6e225e37833a764ac2da7b7fadf5fe374
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 30379ea6e225e37833a764ac2da7b7fadf5fe374 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/core/tests/test_evalf.py
git checkout 30379ea6e225e37833a764ac2da7b7fadf5fe374 
