#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 22623bd8c265b78b161542663ee980738441c307
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install .
git checkout 22623bd8c265b78b161542663ee980738441c307 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA test_requests.py
git checkout 22623bd8c265b78b161542663ee980738441c307 
