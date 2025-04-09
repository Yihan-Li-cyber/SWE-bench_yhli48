#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff a3011dfd1aaa2487cce8aa7369475533133ef777
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout a3011dfd1aaa2487cce8aa7369475533133ef777 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_colors.py
git checkout a3011dfd1aaa2487cce8aa7369475533133ef777 
