#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 091991be0da19de9108dbe5e3752917fea3d7fdc
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install .
git checkout 091991be0da19de9108dbe5e3752917fea3d7fdc 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA test_requests.py
git checkout 091991be0da19de9108dbe5e3752917fea3d7fdc 
