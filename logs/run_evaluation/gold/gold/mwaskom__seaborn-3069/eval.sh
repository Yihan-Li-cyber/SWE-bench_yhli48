#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 54cab15bdacfaa05a88fbc5502a5b322d99f148e
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[dev]
git checkout 54cab15bdacfaa05a88fbc5502a5b322d99f148e 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest --no-header -rA tests/_core/test_plot.py
git checkout 54cab15bdacfaa05a88fbc5502a5b322d99f148e 
