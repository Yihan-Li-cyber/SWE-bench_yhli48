#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 647480166bfe7532e8c471fef0146e3a17e6c0c9
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 647480166bfe7532e8c471fef0146e3a17e6c0c9 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 migrations.test_operations
git checkout 647480166bfe7532e8c471fef0146e3a17e6c0c9 
