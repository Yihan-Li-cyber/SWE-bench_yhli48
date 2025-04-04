#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 5ca694b38d861c0e24cd8743753427dda839b90b
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 5ca694b38d861c0e24cd8743753427dda839b90b 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_axes.py
git checkout 5ca694b38d861c0e24cd8743753427dda839b90b 
