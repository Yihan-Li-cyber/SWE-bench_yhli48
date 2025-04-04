#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 71e7c8e73712419626f1c2b6ec036e8559a2d667
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 71e7c8e73712419626f1c2b6ec036e8559a2d667 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 migrations.test_autodetector
git checkout 71e7c8e73712419626f1c2b6ec036e8559a2d667 
