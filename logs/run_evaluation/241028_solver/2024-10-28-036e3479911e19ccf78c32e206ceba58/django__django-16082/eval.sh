#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff bf47c719719d0e190a99fa2e7f959d5bbb7caf8a
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout bf47c719719d0e190a99fa2e7f959d5bbb7caf8a 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 expressions.tests
git checkout bf47c719719d0e190a99fa2e7f959d5bbb7caf8a 
