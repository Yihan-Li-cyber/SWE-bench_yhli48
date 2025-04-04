#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff c98bc4cd3d687fe9b392d8eecd905627191d4f06
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout c98bc4cd3d687fe9b392d8eecd905627191d4f06 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA testing/test_unittest.py
git checkout c98bc4cd3d687fe9b392d8eecd905627191d4f06 
