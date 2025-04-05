#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 466920f6d726eee90d5566e0a9948e92b33a122e
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 466920f6d726eee90d5566e0a9948e92b33a122e 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 expressions.tests
git checkout 466920f6d726eee90d5566e0a9948e92b33a122e 
