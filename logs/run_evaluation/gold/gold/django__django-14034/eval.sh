#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff db1fc5cd3c5d36cdb5d0fe4404efd6623dd3e8fb
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout db1fc5cd3c5d36cdb5d0fe4404efd6623dd3e8fb 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 forms_tests.field_tests.test_multivaluefield
git checkout db1fc5cd3c5d36cdb5d0fe4404efd6623dd3e8fb 
