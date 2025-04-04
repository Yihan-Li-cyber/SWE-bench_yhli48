#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 8c3bd0b708b488a1f6e8bd8cc6b96569904605be
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 8c3bd0b708b488a1f6e8bd8cc6b96569904605be 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 migrations.test_executor
git checkout 8c3bd0b708b488a1f6e8bd8cc6b96569904605be 
