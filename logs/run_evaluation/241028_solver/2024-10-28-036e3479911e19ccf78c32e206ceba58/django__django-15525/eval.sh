#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff fbacaa58ffc5a62456ee68b90efa13957f761ce4
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout fbacaa58ffc5a62456ee68b90efa13957f761ce4 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 backends.sqlite.test_features fixtures_regress.models fixtures_regress.tests
git checkout fbacaa58ffc5a62456ee68b90efa13957f761ce4 
