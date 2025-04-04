#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 5e6da19f0e44a0ae83944fb6ce18f18f781e1a6e
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout 5e6da19f0e44a0ae83944fb6ce18f18f781e1a6e 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/test_ext_autodoc_private_members.py
git checkout 5e6da19f0e44a0ae83944fb6ce18f18f781e1a6e 
