#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 876fa81e0a038cda466925b85ccf6c5452e0f685
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout 876fa81e0a038cda466925b85ccf6c5452e0f685 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/roots/test-ext-autodoc/target/classes.py tests/test_ext_autodoc_autoclass.py
git checkout 876fa81e0a038cda466925b85ccf6c5452e0f685 
