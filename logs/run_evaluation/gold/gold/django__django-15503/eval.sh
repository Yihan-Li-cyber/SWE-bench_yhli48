#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 859a87d873ce7152af73ab851653b4e1c3ffea4c
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 859a87d873ce7152af73ab851653b4e1c3ffea4c 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 model_fields.test_jsonfield
git checkout 859a87d873ce7152af73ab851653b4e1c3ffea4c 
