#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff b19bce971e82f2497d67fdacdeca8db08ae0ba56
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout b19bce971e82f2497d67fdacdeca8db08ae0ba56 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/roots/test-ext-autodoc/target/empty_all.py tests/test_ext_autodoc_automodule.py
git checkout b19bce971e82f2497d67fdacdeca8db08ae0ba56 
