#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 21698c14461d27933864d73e6fba568a154e83b3
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout 21698c14461d27933864d73e6fba568a154e83b3 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/test_markup.py
git checkout 21698c14461d27933864d73e6fba568a154e83b3 
