#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff ac2b7599d212af7d04649959ce6926c63c3133fa
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout ac2b7599d212af7d04649959ce6926c63c3133fa 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/roots/test-ext-inheritance_diagram/conf.py tests/roots/test-ext-inheritance_diagram/index.rst tests/roots/test-ext-inheritance_diagram/subdir/index.rst tests/roots/test-ext-inheritance_diagram/subdir/other.py tests/roots/test-ext-inheritance_diagram/test.py tests/test_ext_inheritance_diagram.py
git checkout ac2b7599d212af7d04649959ce6926c63c3133fa 
