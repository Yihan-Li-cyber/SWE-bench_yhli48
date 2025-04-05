#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 7e6b537f5b92be152779fc492bb908d27fe7c52a
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 7e6b537f5b92be152779fc492bb908d27fe7c52a 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 fixtures_regress.tests
git checkout 7e6b537f5b92be152779fc492bb908d27fe7c52a 
