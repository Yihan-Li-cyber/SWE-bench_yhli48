#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff d89f976bddb49fb168334960acc8979c3de991fa
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout d89f976bddb49fb168334960acc8979c3de991fa 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 utils_tests.test_timezone
git checkout d89f976bddb49fb168334960acc8979c3de991fa 
