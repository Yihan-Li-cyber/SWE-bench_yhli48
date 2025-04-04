#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 475cffd1d64c690cdad16ede4d5e81985738ceb4
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 475cffd1d64c690cdad16ede4d5e81985738ceb4 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 admin_views.admin admin_views.tests
git checkout 475cffd1d64c690cdad16ede4d5e81985738ceb4 
