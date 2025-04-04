#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff e4430f22c8e3d29ce5d9d0263fba57121938d06d
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout e4430f22c8e3d29ce5d9d0263fba57121938d06d 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 django.test.testcases servers.tests
git checkout e4430f22c8e3d29ce5d9d0263fba57121938d06d 
