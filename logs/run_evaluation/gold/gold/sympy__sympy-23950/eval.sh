#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 88664e6e0b781d0a8b5347896af74b555e92891e
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 88664e6e0b781d0a8b5347896af74b555e92891e 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/sets/tests/test_contains.py
git checkout 88664e6e0b781d0a8b5347896af74b555e92891e 
