#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff b3e26a6c851133b82b50f4b68b53692076574d13
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout b3e26a6c851133b82b50f4b68b53692076574d13 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/test_domain_py.py tests/test_pycode_ast.py
git checkout b3e26a6c851133b82b50f4b68b53692076574d13 
