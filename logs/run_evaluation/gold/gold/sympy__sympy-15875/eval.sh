#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff b506169ad727ee39cb3d60c8b3ff5e315d443d8e
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout b506169ad727ee39cb3d60c8b3ff5e315d443d8e 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/core/tests/test_arit.py
git checkout b506169ad727ee39cb3d60c8b3ff5e315d443d8e 
