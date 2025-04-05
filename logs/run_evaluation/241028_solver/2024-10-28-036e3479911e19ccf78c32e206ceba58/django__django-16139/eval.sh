#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff d559cb02da30f74debbb1fc3a46de0df134d2d80
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout d559cb02da30f74debbb1fc3a46de0df134d2d80 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 auth_tests.test_forms
git checkout d559cb02da30f74debbb1fc3a46de0df134d2d80 
