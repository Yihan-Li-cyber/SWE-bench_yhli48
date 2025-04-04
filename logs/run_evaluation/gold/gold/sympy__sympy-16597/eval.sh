#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 6fd65310fa3167b9626c38a5487e171ca407d988
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 6fd65310fa3167b9626c38a5487e171ca407d988 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/core/tests/test_assumptions.py sympy/functions/elementary/tests/test_miscellaneous.py
git checkout 6fd65310fa3167b9626c38a5487e171ca407d988 
