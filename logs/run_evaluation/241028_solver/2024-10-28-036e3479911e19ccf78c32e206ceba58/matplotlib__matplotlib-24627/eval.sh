#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 9d22ab09d52d279b125d8770967569de070913b2
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 9d22ab09d52d279b125d8770967569de070913b2 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_axes.py
git checkout 9d22ab09d52d279b125d8770967569de070913b2 
