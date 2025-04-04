#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 0c42cdf0d2422f4c080e93594d5d15381d6e955e
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 0c42cdf0d2422f4c080e93594d5d15381d6e955e 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 check_framework.test_model_checks
git checkout 0c42cdf0d2422f4c080e93594d5d15381d6e955e 
