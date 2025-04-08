#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 9b224579875e30203d079cc2fee83b116d98eb78
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 9b224579875e30203d079cc2fee83b116d98eb78 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 auth_tests.test_basic
git checkout 9b224579875e30203d079cc2fee83b116d98eb78 
