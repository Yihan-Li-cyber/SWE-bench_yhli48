#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff a2a1b0a11b993fe5f8fab64b6161e99243a6393c
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout a2a1b0a11b993fe5f8fab64b6161e99243a6393c 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_category.py
git checkout a2a1b0a11b993fe5f8fab64b6161e99243a6393c 
