#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff d3d173425fc0a1107836da5b4567f1c88253191b
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout d3d173425fc0a1107836da5b4567f1c88253191b 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 admin_checks.tests
git checkout d3d173425fc0a1107836da5b4567f1c88253191b 
