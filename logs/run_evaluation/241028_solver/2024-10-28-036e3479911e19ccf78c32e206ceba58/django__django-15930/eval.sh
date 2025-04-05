#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 63884829acd207404f2a5c3cc1d6b4cd0a822b70
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 63884829acd207404f2a5c3cc1d6b4cd0a822b70 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 expressions_case.tests
git checkout 63884829acd207404f2a5c3cc1d6b4cd0a822b70 
