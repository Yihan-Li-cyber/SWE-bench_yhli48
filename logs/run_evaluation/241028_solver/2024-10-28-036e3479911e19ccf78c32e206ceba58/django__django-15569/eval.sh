#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 884b4c27f506b3c29d58509fc83a35c30ea10d94
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 884b4c27f506b3c29d58509fc83a35c30ea10d94 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 custom_lookups.tests model_fields.test_jsonfield schema.tests
git checkout 884b4c27f506b3c29d58509fc83a35c30ea10d94 
