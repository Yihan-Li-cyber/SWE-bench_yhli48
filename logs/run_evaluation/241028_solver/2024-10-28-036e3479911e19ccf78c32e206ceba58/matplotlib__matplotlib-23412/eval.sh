#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff f06c2c3abdaf4b90285ce5ca7fedbb8ace715911
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout f06c2c3abdaf4b90285ce5ca7fedbb8ace715911 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_patches.py
git checkout f06c2c3abdaf4b90285ce5ca7fedbb8ace715911 
