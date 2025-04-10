#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 2dfa7457f20ee187fbb09b5b6a1631da4458388c
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 2dfa7457f20ee187fbb09b5b6a1631da4458388c 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/matrices/tests/test_sparse.py
git checkout 2dfa7457f20ee187fbb09b5b6a1631da4458388c 
