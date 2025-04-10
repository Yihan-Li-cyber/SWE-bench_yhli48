#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 2aee6ccd7c7e1f8d282c1e7579f4ee546b838542
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 2aee6ccd7c7e1f8d282c1e7579f4ee546b838542 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_contour.py
git checkout 2aee6ccd7c7e1f8d282c1e7579f4ee546b838542 
