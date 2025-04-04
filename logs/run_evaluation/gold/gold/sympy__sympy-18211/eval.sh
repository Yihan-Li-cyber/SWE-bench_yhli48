#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff b4f1aa3540fe68d078d76e78ba59d022dd6df39f
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout b4f1aa3540fe68d078d76e78ba59d022dd6df39f 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/core/tests/test_relational.py
git checkout b4f1aa3540fe68d078d76e78ba59d022dd6df39f 
