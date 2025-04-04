#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff b8fe457a02cc24b3470ff678d0099c350b7fef43
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout b8fe457a02cc24b3470ff678d0099c350b7fef43 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/printing/tests/test_pycode.py
git checkout b8fe457a02cc24b3470ff678d0099c350b7fef43 
