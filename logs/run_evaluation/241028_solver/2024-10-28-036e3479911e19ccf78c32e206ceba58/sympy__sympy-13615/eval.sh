#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 50d8a102f0735da8e165a0369bbb994c7d0592a6
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 50d8a102f0735da8e165a0369bbb994c7d0592a6 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/sets/tests/test_sets.py
git checkout 50d8a102f0735da8e165a0369bbb994c7d0592a6 
