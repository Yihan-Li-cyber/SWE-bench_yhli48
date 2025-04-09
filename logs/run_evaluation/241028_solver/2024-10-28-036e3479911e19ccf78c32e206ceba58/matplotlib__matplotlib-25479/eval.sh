#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 7fdf772201e4c9bafbc16dfac23b5472d6a53fa2
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 7fdf772201e4c9bafbc16dfac23b5472d6a53fa2 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_colors.py
git checkout 7fdf772201e4c9bafbc16dfac23b5472d6a53fa2 
