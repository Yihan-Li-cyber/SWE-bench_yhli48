#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff f0632c0fc7339f68e992ed63ae4cfac76cd41aad
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout f0632c0fc7339f68e992ed63ae4cfac76cd41aad 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_dates.py
git checkout f0632c0fc7339f68e992ed63ae4cfac76cd41aad 
