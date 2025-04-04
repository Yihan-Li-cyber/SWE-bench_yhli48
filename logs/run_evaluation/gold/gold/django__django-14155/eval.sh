#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 2f13c476abe4ba787b6cb71131818341911f43cc
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 2f13c476abe4ba787b6cb71131818341911f43cc 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 urlpatterns_reverse.tests
git checkout 2f13c476abe4ba787b6cb71131818341911f43cc 
