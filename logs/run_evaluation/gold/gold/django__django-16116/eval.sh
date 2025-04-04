#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 5d36a8266c7d5d1994d7a7eeb4016f80d9cb0401
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 5d36a8266c7d5d1994d7a7eeb4016f80d9cb0401 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 migrations.test_commands
git checkout 5d36a8266c7d5d1994d7a7eeb4016f80d9cb0401 
