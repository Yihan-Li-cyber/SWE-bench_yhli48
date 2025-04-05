#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 51c9bb7cd16081133af4f0ab6d06572660309730
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 51c9bb7cd16081133af4f0ab6d06572660309730 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 constraints.tests postgres_tests.test_constraints
git checkout 51c9bb7cd16081133af4f0ab6d06572660309730 
