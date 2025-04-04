#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff beb7ddbcee03270e833b2f74927ccfc8027aa693
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout beb7ddbcee03270e833b2f74927ccfc8027aa693 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 aggregation.tests
git checkout beb7ddbcee03270e833b2f74927ccfc8027aa693 
