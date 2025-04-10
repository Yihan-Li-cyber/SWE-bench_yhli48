#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff f8ffce6d44127d4ea7d6491262ab30046b03294b
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout f8ffce6d44127d4ea7d6491262ab30046b03294b 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_axes.py
git checkout f8ffce6d44127d4ea7d6491262ab30046b03294b 
