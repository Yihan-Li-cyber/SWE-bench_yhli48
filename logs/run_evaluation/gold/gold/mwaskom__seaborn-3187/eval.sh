#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 22cdfb0c93f8ec78492d87edb810f10cb7f57a31
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[dev]
git checkout 22cdfb0c93f8ec78492d87edb810f10cb7f57a31 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest --no-header -rA tests/_core/test_plot.py tests/test_relational.py
git checkout 22cdfb0c93f8ec78492d87edb810f10cb7f57a31 
