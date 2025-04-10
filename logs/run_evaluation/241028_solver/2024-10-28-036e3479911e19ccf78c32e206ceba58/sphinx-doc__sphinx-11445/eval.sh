#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 71db08c05197545944949d5aa76cd340e7143627
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout 71db08c05197545944949d5aa76cd340e7143627 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/test_util_rst.py
git checkout 71db08c05197545944949d5aa76cd340e7143627 
