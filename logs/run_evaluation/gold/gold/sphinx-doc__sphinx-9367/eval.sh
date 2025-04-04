#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 6918e69600810a4664e53653d6ff0290c3c4a788
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout 6918e69600810a4664e53653d6ff0290c3c4a788 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/test_pycode_ast.py
git checkout 6918e69600810a4664e53653d6ff0290c3c4a788 
