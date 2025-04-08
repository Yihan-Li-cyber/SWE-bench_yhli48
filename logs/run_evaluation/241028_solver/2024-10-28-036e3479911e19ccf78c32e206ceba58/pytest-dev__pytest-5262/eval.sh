#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 58e6a09db49f34886ff13f3b7520dd0bcd7063cd
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 58e6a09db49f34886ff13f3b7520dd0bcd7063cd 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA testing/test_capture.py
git checkout 58e6a09db49f34886ff13f3b7520dd0bcd7063cd 
