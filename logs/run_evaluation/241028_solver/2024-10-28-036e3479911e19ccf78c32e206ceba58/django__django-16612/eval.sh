#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 55bcbd8d172b689811fae17cde2f09218dd74e9c
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 55bcbd8d172b689811fae17cde2f09218dd74e9c 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 admin_views.tests
git checkout 55bcbd8d172b689811fae17cde2f09218dd74e9c 
