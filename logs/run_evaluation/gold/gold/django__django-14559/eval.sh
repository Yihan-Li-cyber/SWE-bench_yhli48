#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff d79be3ed39b76d3e34431873eec16f6dd354ab17
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout d79be3ed39b76d3e34431873eec16f6dd354ab17 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 queries.test_bulk_update
git checkout d79be3ed39b76d3e34431873eec16f6dd354ab17 
