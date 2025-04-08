#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff d65c9ca20ddf81ef91199e6d819f9d3506ef477c
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout d65c9ca20ddf81ef91199e6d819f9d3506ef477c 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_axes.py
git checkout d65c9ca20ddf81ef91199e6d819f9d3506ef477c 
