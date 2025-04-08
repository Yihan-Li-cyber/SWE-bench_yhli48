#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 953f29f700a60fc09b08b2c2270c12c447490c6a
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 953f29f700a60fc09b08b2c2270c12c447490c6a 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 apps.tests
git checkout 953f29f700a60fc09b08b2c2270c12c447490c6a 
