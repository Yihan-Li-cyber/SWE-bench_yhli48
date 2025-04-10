#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 795747bdb6b8fb7d717d5bbfc2c3316869e66a73
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout 795747bdb6b8fb7d717d5bbfc2c3316869e66a73 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/test_intl.py
git checkout 795747bdb6b8fb7d717d5bbfc2c3316869e66a73 
