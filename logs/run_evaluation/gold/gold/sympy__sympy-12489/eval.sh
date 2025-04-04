#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff aa9780761ad8c3c0f68beeef3a0ce5caac9e100b
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout aa9780761ad8c3c0f68beeef3a0ce5caac9e100b 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/combinatorics/tests/test_permutations.py
git checkout aa9780761ad8c3c0f68beeef3a0ce5caac9e100b 
