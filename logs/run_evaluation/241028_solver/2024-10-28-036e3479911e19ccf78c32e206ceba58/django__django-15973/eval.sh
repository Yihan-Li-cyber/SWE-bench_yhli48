#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 2480554dc4ada4ecf3f6a08e318735a2e50783f3
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 2480554dc4ada4ecf3f6a08e318735a2e50783f3 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 migrations.test_autodetector
git checkout 2480554dc4ada4ecf3f6a08e318735a2e50783f3 
