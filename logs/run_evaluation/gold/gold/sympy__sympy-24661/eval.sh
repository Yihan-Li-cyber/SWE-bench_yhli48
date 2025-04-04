#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff a36caf5c74fe654cedc488e8a8a05fad388f8406
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout a36caf5c74fe654cedc488e8a8a05fad388f8406 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/parsing/tests/test_sympy_parser.py
git checkout a36caf5c74fe654cedc488e8a8a05fad388f8406 
