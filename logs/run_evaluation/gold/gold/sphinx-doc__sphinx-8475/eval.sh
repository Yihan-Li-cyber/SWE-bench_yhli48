#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 3ea1ec84cc610f7a9f4f6b354e264565254923ff
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout 3ea1ec84cc610f7a9f4f6b354e264565254923ff 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/test_build_linkcheck.py
git checkout 3ea1ec84cc610f7a9f4f6b354e264565254923ff 
