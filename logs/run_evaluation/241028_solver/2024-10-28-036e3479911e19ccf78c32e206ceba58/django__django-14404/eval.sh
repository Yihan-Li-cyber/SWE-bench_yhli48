#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff de32fe83a2e4a20887972c69a0693b94eb25a88b
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout de32fe83a2e4a20887972c69a0693b94eb25a88b 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 admin_views.tests
git checkout de32fe83a2e4a20887972c69a0693b94eb25a88b 
