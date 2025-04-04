#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff b7ce415c15eb39b026a097a2865da73fbcf15c9c
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout b7ce415c15eb39b026a097a2865da73fbcf15c9c 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_image.py
git checkout b7ce415c15eb39b026a097a2865da73fbcf15c9c 
