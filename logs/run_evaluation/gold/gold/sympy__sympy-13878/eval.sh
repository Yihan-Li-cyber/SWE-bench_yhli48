#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 7b127bdf71a36d85216315f80c1b54d22b060818
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 7b127bdf71a36d85216315f80c1b54d22b060818 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/stats/tests/test_continuous_rv.py
git checkout 7b127bdf71a36d85216315f80c1b54d22b060818 
