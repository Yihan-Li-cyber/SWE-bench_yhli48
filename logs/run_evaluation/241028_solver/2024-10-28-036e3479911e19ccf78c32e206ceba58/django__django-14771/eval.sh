#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 4884a87e022056eda10534c13d74e49b8cdda632
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 4884a87e022056eda10534c13d74e49b8cdda632 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 utils_tests.test_autoreload
git checkout 4884a87e022056eda10534c13d74e49b8cdda632 
