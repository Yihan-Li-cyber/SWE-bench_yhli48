#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 30613d6a748fce18919ff8b0da166d9fda2ed9bc
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 30613d6a748fce18919ff8b0da166d9fda2ed9bc 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 expressions.tests
git checkout 30613d6a748fce18919ff8b0da166d9fda2ed9bc 
