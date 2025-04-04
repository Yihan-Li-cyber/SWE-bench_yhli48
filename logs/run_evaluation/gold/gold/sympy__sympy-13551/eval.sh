#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 9476425b9e34363c2d9ac38e9f04aa75ae54a775
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 9476425b9e34363c2d9ac38e9f04aa75ae54a775 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/concrete/tests/test_products.py
git checkout 9476425b9e34363c2d9ac38e9f04aa75ae54a775 
