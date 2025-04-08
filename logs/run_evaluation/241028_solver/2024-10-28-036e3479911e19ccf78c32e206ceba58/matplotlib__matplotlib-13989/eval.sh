#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff a3e2897bfaf9eaac1d6649da535c4e721c89fa69
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout a3e2897bfaf9eaac1d6649da535c4e721c89fa69 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_axes.py
git checkout a3e2897bfaf9eaac1d6649da535c4e721c89fa69 
