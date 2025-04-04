#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff e05fddea852d08fc0845f954b79deb9e9f9ff883
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout e05fddea852d08fc0845f954b79deb9e9f9ff883 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA xarray/tests/test_duck_array_ops.py
git checkout e05fddea852d08fc0845f954b79deb9e9f9ff883 
