#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 910ecd1b8df7678f45c3d507dde6bcb1faafa243
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 910ecd1b8df7678f45c3d507dde6bcb1faafa243 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 forms_tests.tests.test_forms
git checkout 910ecd1b8df7678f45c3d507dde6bcb1faafa243 
