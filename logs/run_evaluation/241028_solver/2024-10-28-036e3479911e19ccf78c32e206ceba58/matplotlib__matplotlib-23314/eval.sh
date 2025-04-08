#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 97fc1154992f64cfb2f86321155a7404efeb2d8a
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 97fc1154992f64cfb2f86321155a7404efeb2d8a 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_axes.py lib/mpl_toolkits/tests/test_mplot3d.py
git checkout 97fc1154992f64cfb2f86321155a7404efeb2d8a 
