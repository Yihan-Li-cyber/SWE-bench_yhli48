#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff f5e965947af2410ded92cfad987aaf45262ea434
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout f5e965947af2410ded92cfad987aaf45262ea434 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/geometry/tests/test_point.py
git checkout f5e965947af2410ded92cfad987aaf45262ea434 
