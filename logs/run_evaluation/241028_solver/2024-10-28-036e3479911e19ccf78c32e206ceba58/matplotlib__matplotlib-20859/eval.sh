#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 64619e53e9d0ed417daba287ac0d3a06943a54d5
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 64619e53e9d0ed417daba287ac0d3a06943a54d5 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_legend.py
git checkout 64619e53e9d0ed417daba287ac0d3a06943a54d5 
