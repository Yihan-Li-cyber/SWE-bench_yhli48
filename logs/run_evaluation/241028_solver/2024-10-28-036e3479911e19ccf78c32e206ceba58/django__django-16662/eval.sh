#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 0eb3e9bd754e4c9fac8b616b705178727fc8031e
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 0eb3e9bd754e4c9fac8b616b705178727fc8031e 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 migrations.test_writer
git checkout 0eb3e9bd754e4c9fac8b616b705178727fc8031e 
