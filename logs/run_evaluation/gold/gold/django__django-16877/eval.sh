#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 98f6ada0e2058d67d91fb6c16482411ec2ca0967
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 98f6ada0e2058d67d91fb6c16482411ec2ca0967 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 template_tests.filter_tests.test_escapeseq
git checkout 98f6ada0e2058d67d91fb6c16482411ec2ca0967 
