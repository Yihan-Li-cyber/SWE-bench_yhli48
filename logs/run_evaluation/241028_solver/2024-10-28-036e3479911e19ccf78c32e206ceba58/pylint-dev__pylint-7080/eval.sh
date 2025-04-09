#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 3c5eca2ded3dd2b59ebaf23eb289453b5d2930f0
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 3c5eca2ded3dd2b59ebaf23eb289453b5d2930f0 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA tests/test_self.py
git checkout 3c5eca2ded3dd2b59ebaf23eb289453b5d2930f0 
