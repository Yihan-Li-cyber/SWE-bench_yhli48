#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 4b452338f914d4f6b54704222d70ae8a746e3db5
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout 4b452338f914d4f6b54704222d70ae8a746e3db5 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/test_domain_py.py
git checkout 4b452338f914d4f6b54704222d70ae8a746e3db5 
