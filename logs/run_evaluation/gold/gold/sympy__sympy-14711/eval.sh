#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff c6753448b5c34f95e250105d76709fe4d349ca1f
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout c6753448b5c34f95e250105d76709fe4d349ca1f 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/physics/vector/tests/test_vector.py
git checkout c6753448b5c34f95e250105d76709fe4d349ca1f 
