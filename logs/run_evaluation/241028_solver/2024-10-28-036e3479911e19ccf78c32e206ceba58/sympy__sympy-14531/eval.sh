#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 205da797006360fc629110937e39a19c9561313e
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 205da797006360fc629110937e39a19c9561313e 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/printing/tests/test_python.py sympy/printing/tests/test_str.py
git checkout 205da797006360fc629110937e39a19c9561313e 
