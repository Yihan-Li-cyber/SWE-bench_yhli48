#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 9a6e2df3a8f01ea761529bec48e5a8dc0ea9575b
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 9a6e2df3a8f01ea761529bec48e5a8dc0ea9575b 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 messages_tests.base messages_tests.tests
git checkout 9a6e2df3a8f01ea761529bec48e5a8dc0ea9575b 
