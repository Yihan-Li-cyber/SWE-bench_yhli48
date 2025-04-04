#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 94fb720696f5f5d12bad8bc813699fd696afd2fb
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 94fb720696f5f5d12bad8bc813699fd696afd2fb 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/printing/tests/test_repr.py
git checkout 94fb720696f5f5d12bad8bc813699fd696afd2fb 
