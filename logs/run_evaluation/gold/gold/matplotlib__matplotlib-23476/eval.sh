#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 33a0599711d26dc2b79f851c6daed4947df7c167
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 33a0599711d26dc2b79f851c6daed4947df7c167 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_figure.py
git checkout 33a0599711d26dc2b79f851c6daed4947df7c167 
