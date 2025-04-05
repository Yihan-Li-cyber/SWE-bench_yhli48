#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff e1d673c373a7d032060872b690a92fc95496612e
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout e1d673c373a7d032060872b690a92fc95496612e 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 admin_changelist.admin admin_changelist.tests
git checkout e1d673c373a7d032060872b690a92fc95496612e 
