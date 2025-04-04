#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff a708f39ce67af174df90c5b5e50ad1976cec7cb8
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout a708f39ce67af174df90c5b5e50ad1976cec7cb8 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 validators.tests
git checkout a708f39ce67af174df90c5b5e50ad1976cec7cb8 
