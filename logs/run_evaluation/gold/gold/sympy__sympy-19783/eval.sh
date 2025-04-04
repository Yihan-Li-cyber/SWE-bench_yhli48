#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 586a43201d0357e92e8c93548d69a9f42bf548f4
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 586a43201d0357e92e8c93548d69a9f42bf548f4 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/physics/quantum/tests/test_dagger.py sympy/physics/quantum/tests/test_operator.py
git checkout 586a43201d0357e92e8c93548d69a9f42bf548f4 
