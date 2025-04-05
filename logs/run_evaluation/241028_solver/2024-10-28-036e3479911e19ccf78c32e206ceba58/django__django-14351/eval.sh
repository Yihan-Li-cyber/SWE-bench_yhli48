#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 06fd4df41afb5aa1d681b853c3c08d8c688ca3a5
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 06fd4df41afb5aa1d681b853c3c08d8c688ca3a5 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 aggregation_regress.tests
git checkout 06fd4df41afb5aa1d681b853c3c08d8c688ca3a5 
