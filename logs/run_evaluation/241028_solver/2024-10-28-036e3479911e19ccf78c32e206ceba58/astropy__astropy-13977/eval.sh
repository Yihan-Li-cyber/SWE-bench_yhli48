#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 5250b2442501e6c671c6b380536f1edb352602d1
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test] --verbose
git checkout 5250b2442501e6c671c6b380536f1edb352602d1 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA astropy/units/tests/test_quantity.py astropy/units/tests/test_quantity_ufuncs.py
git checkout 5250b2442501e6c671c6b380536f1edb352602d1 
