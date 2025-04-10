#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 118f4d996e7711c9aced916e6049af9f28d5ec66
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 118f4d996e7711c9aced916e6049af9f28d5ec66 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA xarray/tests/test_combine.py
git checkout 118f4d996e7711c9aced916e6049af9f28d5ec66 
