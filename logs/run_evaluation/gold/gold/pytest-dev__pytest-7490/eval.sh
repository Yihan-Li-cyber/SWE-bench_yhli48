#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 7f7a36478abe7dd1fa993b115d22606aa0e35e88
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 7f7a36478abe7dd1fa993b115d22606aa0e35e88 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA testing/test_skipping.py
git checkout 7f7a36478abe7dd1fa993b115d22606aa0e35e88 
