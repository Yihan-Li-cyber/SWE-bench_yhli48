#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 8cc34cb412ba89ebca12fc84f76a9e452628f1bc
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 8cc34cb412ba89ebca12fc84f76a9e452628f1bc 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA xarray/tests/test_dataset.py xarray/tests/test_units.py
git checkout 8cc34cb412ba89ebca12fc84f76a9e452628f1bc 
