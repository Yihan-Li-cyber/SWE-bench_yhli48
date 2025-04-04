#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff aefdd023dc4f73c441953ed51f5f05a076f0862f
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout aefdd023dc4f73c441953ed51f5f05a076f0862f 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/simplify/tests/test_simplify.py
git checkout aefdd023dc4f73c441953ed51f5f05a076f0862f 
