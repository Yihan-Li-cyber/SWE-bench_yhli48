#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff ba80d1e493f21431b4bf729b3e0452cd47eb9566
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout ba80d1e493f21431b4bf729b3e0452cd47eb9566 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/ntheory/tests/test_residue.py sympy/solvers/tests/test_solveset.py
git checkout ba80d1e493f21431b4bf729b3e0452cd47eb9566 
