#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff f39634ff229887bf7790c069d0c411b38494ca38
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout f39634ff229887bf7790c069d0c411b38494ca38 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 many_to_one.models many_to_one.tests
git checkout f39634ff229887bf7790c069d0c411b38494ca38 
