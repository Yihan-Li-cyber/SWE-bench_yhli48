#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 66ba515e671638971bd11a34cff12c107a437e0b
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 66ba515e671638971bd11a34cff12c107a437e0b 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_pickle.py
git checkout 66ba515e671638971bd11a34cff12c107a437e0b 
