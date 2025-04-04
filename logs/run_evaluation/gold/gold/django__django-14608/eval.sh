#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 7f33c1e22dbc34a7afae7967783725b10f1f13b1
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 7f33c1e22dbc34a7afae7967783725b10f1f13b1 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 admin_views.tests forms_tests.tests.test_formsets
git checkout 7f33c1e22dbc34a7afae7967783725b10f1f13b1 
