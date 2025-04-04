#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 10de1a18a0efac0b19b611e40c928250dda688bf
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 10de1a18a0efac0b19b611e40c928250dda688bf 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/matrices/tests/test_normalforms.py sympy/polys/matrices/tests/test_normalforms.py
git checkout 10de1a18a0efac0b19b611e40c928250dda688bf 
