#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 8ec06e9a1bd862cd713b9db748e039ccc7b3e15b
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout 8ec06e9a1bd862cd713b9db748e039ccc7b3e15b 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/test_util_inspect.py
git checkout 8ec06e9a1bd862cd713b9db748e039ccc7b3e15b 
