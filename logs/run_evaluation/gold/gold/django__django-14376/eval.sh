#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff d06c5b358149c02a62da8a5469264d05f29ac659
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout d06c5b358149c02a62da8a5469264d05f29ac659 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 dbshell.test_mysql
git checkout d06c5b358149c02a62da8a5469264d05f29ac659 
