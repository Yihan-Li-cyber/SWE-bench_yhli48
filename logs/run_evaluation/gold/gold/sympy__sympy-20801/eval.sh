#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff e11d3fed782146eebbffdc9ced0364b223b84b6c
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout e11d3fed782146eebbffdc9ced0364b223b84b6c 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/core/tests/test_numbers.py
git checkout e11d3fed782146eebbffdc9ced0364b223b84b6c 
