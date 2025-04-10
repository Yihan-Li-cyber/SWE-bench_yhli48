#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 6f54459aa0248bf1467ad12ee6333d8bc924a642
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 6f54459aa0248bf1467ad12ee6333d8bc924a642 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/combinatorics/tests/test_perm_groups.py
git checkout 6f54459aa0248bf1467ad12ee6333d8bc924a642 
