#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff a0d2e399729d36499a1924e5ca5bc067c8396810
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout a0d2e399729d36499a1924e5ca5bc067c8396810 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_axes.py
git checkout a0d2e399729d36499a1924e5ca5bc067c8396810 
