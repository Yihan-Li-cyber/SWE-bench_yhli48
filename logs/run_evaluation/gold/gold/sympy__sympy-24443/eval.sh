#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 809c53c077485ca48a206cee78340389cb83b7f1
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 809c53c077485ca48a206cee78340389cb83b7f1 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/combinatorics/tests/test_homomorphisms.py
git checkout 809c53c077485ca48a206cee78340389cb83b7f1 
