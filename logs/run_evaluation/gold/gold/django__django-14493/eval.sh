#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 7272e1963ffdf39c1d4fe225d5425a45dd095d11
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 7272e1963ffdf39c1d4fe225d5425a45dd095d11 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 staticfiles_tests.storage staticfiles_tests.test_storage
git checkout 7272e1963ffdf39c1d4fe225d5425a45dd095d11 
