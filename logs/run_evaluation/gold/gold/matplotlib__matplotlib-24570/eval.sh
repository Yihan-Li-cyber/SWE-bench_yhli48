#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 8f0003ae902952372824c9917975fb372c026a42
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 8f0003ae902952372824c9917975fb372c026a42 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_offsetbox.py
git checkout 8f0003ae902952372824c9917975fb372c026a42 
