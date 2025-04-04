#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff f30284ef926ebaf04b176f21b421e2dffc679792
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout f30284ef926ebaf04b176f21b421e2dffc679792 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/test_build_linkcheck.py
git checkout f30284ef926ebaf04b176f21b421e2dffc679792 
