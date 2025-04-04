#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 36fa071d6ebd18a61c4d7f1b5c9d17106134bd44
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 36fa071d6ebd18a61c4d7f1b5c9d17106134bd44 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 migrations.test_writer
git checkout 36fa071d6ebd18a61c4d7f1b5c9d17106134bd44 
