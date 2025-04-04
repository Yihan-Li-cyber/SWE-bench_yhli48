#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 444b6da7cc229a58a2c476a52e45233001dc7073
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 444b6da7cc229a58a2c476a52e45233001dc7073 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 sitemaps_tests.test_http sitemaps_tests.urls.http
git checkout 444b6da7cc229a58a2c476a52e45233001dc7073 
