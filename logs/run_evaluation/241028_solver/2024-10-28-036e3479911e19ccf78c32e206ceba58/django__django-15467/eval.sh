#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff e0442a628eb480eac6a7888aed5a86f83499e299
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout e0442a628eb480eac6a7888aed5a86f83499e299 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 admin_widgets.tests
git checkout e0442a628eb480eac6a7888aed5a86f83499e299 
