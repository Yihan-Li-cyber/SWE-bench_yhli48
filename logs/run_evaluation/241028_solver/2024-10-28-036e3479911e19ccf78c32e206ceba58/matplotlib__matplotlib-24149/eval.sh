#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff af39f1edffcd828f05cfdd04f2e59506bb4a27bc
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout af39f1edffcd828f05cfdd04f2e59506bb4a27bc 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_axes.py
git checkout af39f1edffcd828f05cfdd04f2e59506bb4a27bc 
