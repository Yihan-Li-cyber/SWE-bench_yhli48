#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 361bb8f786f112ee275be136795c0b1ecefff928
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 361bb8f786f112ee275be136795c0b1ecefff928 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 backends.base.test_creation migrations.test_executor
git checkout 361bb8f786f112ee275be136795c0b1ecefff928 
