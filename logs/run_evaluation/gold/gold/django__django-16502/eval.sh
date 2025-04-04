#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 246eb4836a6fb967880f838aa0d22ecfdca8b6f1
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 246eb4836a6fb967880f838aa0d22ecfdca8b6f1 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 servers.test_basehttp
git checkout 246eb4836a6fb967880f838aa0d22ecfdca8b6f1 
