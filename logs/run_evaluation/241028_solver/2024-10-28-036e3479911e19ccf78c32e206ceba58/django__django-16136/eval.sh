#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 19e6efa50b603af325e7f62058364f278596758f
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 19e6efa50b603af325e7f62058364f278596758f 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 async.tests
git checkout 19e6efa50b603af325e7f62058364f278596758f 
