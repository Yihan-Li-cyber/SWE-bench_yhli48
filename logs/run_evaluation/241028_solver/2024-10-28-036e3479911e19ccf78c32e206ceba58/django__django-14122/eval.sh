#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff bc04941bf811d1ea2c79fb7fc20457ed2c7e3410
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout bc04941bf811d1ea2c79fb7fc20457ed2c7e3410 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 ordering.tests
git checkout bc04941bf811d1ea2c79fb7fc20457ed2c7e3410 
