#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 4a72da71001f154ea60906a2f74898d32b7322a7
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 4a72da71001f154ea60906a2f74898d32b7322a7 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 migrations.test_writer
git checkout 4a72da71001f154ea60906a2f74898d32b7322a7 
