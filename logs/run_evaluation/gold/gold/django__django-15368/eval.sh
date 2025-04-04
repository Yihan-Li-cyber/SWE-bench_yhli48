#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff e972620ada4f9ed7bc57f28e133e85c85b0a7b20
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout e972620ada4f9ed7bc57f28e133e85c85b0a7b20 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 queries.test_bulk_update
git checkout e972620ada4f9ed7bc57f28e133e85c85b0a7b20 
