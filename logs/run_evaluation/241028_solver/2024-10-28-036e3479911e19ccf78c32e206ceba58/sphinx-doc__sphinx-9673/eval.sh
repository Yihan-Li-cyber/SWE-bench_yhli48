#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 5fb51fb1467dc5eea7505402c3c5d9b378d3b441
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout 5fb51fb1467dc5eea7505402c3c5d9b378d3b441 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/test_ext_autodoc_configs.py
git checkout 5fb51fb1467dc5eea7505402c3c5d9b378d3b441 
