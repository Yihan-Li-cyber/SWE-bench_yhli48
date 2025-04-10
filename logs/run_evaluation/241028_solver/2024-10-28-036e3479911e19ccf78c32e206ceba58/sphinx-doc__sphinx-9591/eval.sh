#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 9ed054279aeffd5b1d0642e2d24a8800389de29f
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout 9ed054279aeffd5b1d0642e2d24a8800389de29f 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/test_domain_py.py
git checkout 9ed054279aeffd5b1d0642e2d24a8800389de29f 
