#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 110997fe18b9f7d5ba7d22f624d156a29bf40759
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 110997fe18b9f7d5ba7d22f624d156a29bf40759 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/sets/tests/test_fancysets.py
git checkout 110997fe18b9f7d5ba7d22f624d156a29bf40759 
