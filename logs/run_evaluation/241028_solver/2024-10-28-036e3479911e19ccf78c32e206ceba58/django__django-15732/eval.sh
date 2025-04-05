#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff ce69e34bd646558bb44ea92cecfd98b345a0b3e0
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout ce69e34bd646558bb44ea92cecfd98b345a0b3e0 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 migrations.test_operations
git checkout ce69e34bd646558bb44ea92cecfd98b345a0b3e0 
