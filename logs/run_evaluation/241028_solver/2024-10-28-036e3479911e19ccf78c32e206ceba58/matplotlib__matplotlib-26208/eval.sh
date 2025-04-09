#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff f0f133943d3e4f1e2e665291fe1c8f658a84cc09
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout f0f133943d3e4f1e2e665291fe1c8f658a84cc09 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_axes.py
git checkout f0f133943d3e4f1e2e665291fe1c8f658a84cc09 
