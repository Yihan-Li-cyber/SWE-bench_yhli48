#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 5a8e8f80bb82a867eab7e4d9d099f21d0a976d22
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 5a8e8f80bb82a867eab7e4d9d099f21d0a976d22 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 utils_tests.test_autoreload utils_tests.test_module.main_module
git checkout 5a8e8f80bb82a867eab7e4d9d099f21d0a976d22 
