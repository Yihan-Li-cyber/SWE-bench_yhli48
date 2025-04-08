#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 7cc6cc991e586a6158bb656b8001234ccda25407
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 7cc6cc991e586a6158bb656b8001234ccda25407 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA xarray/tests/test_rolling.py
git checkout 7cc6cc991e586a6158bb656b8001234ccda25407 
