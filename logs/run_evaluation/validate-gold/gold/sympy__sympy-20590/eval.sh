#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff cffd4e0f86fefd4802349a9f9b19ed70934ea354
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout cffd4e0f86fefd4802349a9f9b19ed70934ea354 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/core/tests/test_basic.py
git checkout cffd4e0f86fefd4802349a9f9b19ed70934ea354 
