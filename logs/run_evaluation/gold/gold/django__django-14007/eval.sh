#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 619f26d2895d121854b1bed1b535d42b722e2eba
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 619f26d2895d121854b1bed1b535d42b722e2eba 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 custom_pk.fields custom_pk.models custom_pk.tests
git checkout 619f26d2895d121854b1bed1b535d42b722e2eba 
