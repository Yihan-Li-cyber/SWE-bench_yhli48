#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff c6c7ec1978c22ae2c704555a873d0ec6e1e2eaa8
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout c6c7ec1978c22ae2c704555a873d0ec6e1e2eaa8 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_colorbar.py
git checkout c6c7ec1978c22ae2c704555a873d0ec6e1e2eaa8 
