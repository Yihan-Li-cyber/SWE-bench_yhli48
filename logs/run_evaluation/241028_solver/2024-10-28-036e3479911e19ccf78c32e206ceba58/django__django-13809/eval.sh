#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff bef6f7584280f1cc80e5e2d80b7ad073a93d26ec
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout bef6f7584280f1cc80e5e2d80b7ad073a93d26ec 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 admin_scripts.tests utils_tests.test_autoreload
git checkout bef6f7584280f1cc80e5e2d80b7ad073a93d26ec 
