#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff ef6e6a7b86f8479b9a1fecf15ad5b88a2326b31e
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout ef6e6a7b86f8479b9a1fecf15ad5b88a2326b31e 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA xarray/tests/test_merge.py
git checkout ef6e6a7b86f8479b9a1fecf15ad5b88a2326b31e 
