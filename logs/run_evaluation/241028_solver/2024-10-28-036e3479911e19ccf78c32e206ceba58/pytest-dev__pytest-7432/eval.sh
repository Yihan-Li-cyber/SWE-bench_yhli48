#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff e6e300e729dd33956e5448d8be9a0b1540b4e53a
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout e6e300e729dd33956e5448d8be9a0b1540b4e53a 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA testing/test_skipping.py
git checkout e6e300e729dd33956e5448d8be9a0b1540b4e53a 
