#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 0ab58c120939093fea90822f376e1866fc714d1f
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 0ab58c120939093fea90822f376e1866fc714d1f 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 schema.tests
git checkout 0ab58c120939093fea90822f376e1866fc714d1f 
