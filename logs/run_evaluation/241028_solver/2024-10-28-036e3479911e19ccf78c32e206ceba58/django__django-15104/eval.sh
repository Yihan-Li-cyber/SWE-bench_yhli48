#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff a7e7043c8746933dafce652507d3b821801cdc7d
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout a7e7043c8746933dafce652507d3b821801cdc7d 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 migrations.test_autodetector
git checkout a7e7043c8746933dafce652507d3b821801cdc7d 
