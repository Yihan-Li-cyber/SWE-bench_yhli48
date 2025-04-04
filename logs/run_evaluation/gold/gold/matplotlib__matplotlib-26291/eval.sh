#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff fa68f46289adf4a8a4bc7ba97ded8258ec9d079c
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout fa68f46289adf4a8a4bc7ba97ded8258ec9d079c 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/mpl_toolkits/axes_grid1/tests/test_axes_grid1.py
git checkout fa68f46289adf4a8a4bc7ba97ded8258ec9d079c 
