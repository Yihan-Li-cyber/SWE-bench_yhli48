#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 93cedc82f29076c824d476354527af1150888e4f
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 93cedc82f29076c824d476354527af1150888e4f 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 basic.tests
git checkout 93cedc82f29076c824d476354527af1150888e4f 
