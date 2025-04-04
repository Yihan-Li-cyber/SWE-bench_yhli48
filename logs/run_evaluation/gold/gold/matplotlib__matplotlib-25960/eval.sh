#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 1d0d255b79e84dfc9f2123c5eb85a842d342f72b
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 1d0d255b79e84dfc9f2123c5eb85a842d342f72b 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_figure.py
git checkout 1d0d255b79e84dfc9f2123c5eb85a842d342f72b 
