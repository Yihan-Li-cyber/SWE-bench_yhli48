#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff d16bfe05a744909de4b27f5875fe0d4ed41ce607
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test] --verbose
git checkout d16bfe05a744909de4b27f5875fe0d4ed41ce607 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA astropy/modeling/tests/test_separable.py
git checkout d16bfe05a744909de4b27f5875fe0d4ed41ce607 
