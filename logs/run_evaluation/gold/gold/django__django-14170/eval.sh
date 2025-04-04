#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 6efc35b4fe3009666e56a60af0675d7d532bf4ff
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 6efc35b4fe3009666e56a60af0675d7d532bf4ff 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 db_functions.datetime.test_extract_trunc
git checkout 6efc35b4fe3009666e56a60af0675d7d532bf4ff 
