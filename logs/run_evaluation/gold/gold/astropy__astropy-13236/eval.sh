#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 6ed769d58d89380ebaa1ef52b300691eefda8928
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test] --verbose
git checkout 6ed769d58d89380ebaa1ef52b300691eefda8928 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA astropy/table/tests/test_mixin.py astropy/table/tests/test_table.py
git checkout 6ed769d58d89380ebaa1ef52b300691eefda8928 
