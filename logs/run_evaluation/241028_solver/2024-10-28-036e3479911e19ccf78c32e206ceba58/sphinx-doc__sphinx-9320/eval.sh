#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff e05cef574b8f23ab1b57f57e7da6dee509a4e230
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout e05cef574b8f23ab1b57f57e7da6dee509a4e230 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/test_quickstart.py
git checkout e05cef574b8f23ab1b57f57e7da6dee509a4e230 
