#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 694cf458f16b8d340a3195244196980b2dec34fd
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 694cf458f16b8d340a3195244196980b2dec34fd 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 migrations.test_base migrations.test_operations
git checkout 694cf458f16b8d340a3195244196980b2dec34fd 
