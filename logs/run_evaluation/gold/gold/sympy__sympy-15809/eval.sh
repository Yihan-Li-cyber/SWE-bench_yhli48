#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 28d913d3cead6c5646307ffa6540b21d65059dfd
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 28d913d3cead6c5646307ffa6540b21d65059dfd 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/functions/elementary/tests/test_miscellaneous.py
git checkout 28d913d3cead6c5646307ffa6540b21d65059dfd 
