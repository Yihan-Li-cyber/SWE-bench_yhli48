#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff dd1615c59dc6fff633e27dbb3861f2d27e1fb976
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout dd1615c59dc6fff633e27dbb3861f2d27e1fb976 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/roots/test-ext-autodoc/target/instance_variable.py tests/test_ext_autodoc_autoclass.py
git checkout dd1615c59dc6fff633e27dbb3861f2d27e1fb976 
