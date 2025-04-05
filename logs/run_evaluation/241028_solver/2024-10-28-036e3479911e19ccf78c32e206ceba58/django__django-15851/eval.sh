#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff b4817d20b9e55df30be0b1b2ca8c8bb6d61aab07
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout b4817d20b9e55df30be0b1b2ca8c8bb6d61aab07 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 dbshell.test_postgresql
git checkout b4817d20b9e55df30be0b1b2ca8c8bb6d61aab07 
