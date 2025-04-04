#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff c6350d594c359151ee17b0c4f354bb44f28ff69e
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout c6350d594c359151ee17b0c4f354bb44f28ff69e 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 admin_changelist.tests
git checkout c6350d594c359151ee17b0c4f354bb44f28ff69e 
