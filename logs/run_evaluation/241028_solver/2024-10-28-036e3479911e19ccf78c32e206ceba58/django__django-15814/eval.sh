#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 5eb6a2b33d70b9889e1cafa12594ad6f80773d3a
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 5eb6a2b33d70b9889e1cafa12594ad6f80773d3a 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 proxy_models.tests
git checkout 5eb6a2b33d70b9889e1cafa12594ad6f80773d3a 
