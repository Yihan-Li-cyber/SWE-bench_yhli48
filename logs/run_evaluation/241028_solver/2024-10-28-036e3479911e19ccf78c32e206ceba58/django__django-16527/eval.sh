#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff bd366ca2aeffa869b7dbc0b0aa01caea75e6dc31
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout bd366ca2aeffa869b7dbc0b0aa01caea75e6dc31 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 admin_views.test_templatetags
git checkout bd366ca2aeffa869b7dbc0b0aa01caea75e6dc31 
