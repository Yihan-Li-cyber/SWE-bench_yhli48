#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 76e37513e22f4d9a01c7f15eee36fe44388e6670
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 76e37513e22f4d9a01c7f15eee36fe44388e6670 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 async.models async.test_async_related_managers generic_relations.tests
git checkout 76e37513e22f4d9a01c7f15eee36fe44388e6670 
