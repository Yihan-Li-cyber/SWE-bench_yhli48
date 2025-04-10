#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff f050a7775dfc9000f55d023d36d925a8d02ccfa8
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout f050a7775dfc9000f55d023d36d925a8d02ccfa8 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/test_domain_py.py
git checkout f050a7775dfc9000f55d023d36d925a8d02ccfa8 
