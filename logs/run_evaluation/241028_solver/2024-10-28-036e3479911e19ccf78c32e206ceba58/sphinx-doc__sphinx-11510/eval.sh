#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 6cb783c0024a873722952a67ebb9f41771c8eb6d
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout 6cb783c0024a873722952a67ebb9f41771c8eb6d 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/roots/test-directive-include/baz/baz.rst tests/roots/test-directive-include/conf.py tests/roots/test-directive-include/foo.rst tests/test_directive_other.py
git checkout 6cb783c0024a873722952a67ebb9f41771c8eb6d 
