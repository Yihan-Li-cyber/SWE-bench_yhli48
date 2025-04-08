#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 14c96b510ebeba40f573e512299b1976f35b620e
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 14c96b510ebeba40f573e512299b1976f35b620e 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_axes.py
git checkout 14c96b510ebeba40f573e512299b1976f35b620e 
