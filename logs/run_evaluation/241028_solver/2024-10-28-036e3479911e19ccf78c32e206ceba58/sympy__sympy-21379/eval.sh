#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 624217179aaf8d094e6ff75b7493ad1ee47599b0
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 624217179aaf8d094e6ff75b7493ad1ee47599b0 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/core/tests/test_arit.py
git checkout 624217179aaf8d094e6ff75b7493ad1ee47599b0 
