#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff cc183652bf6e1273e985e1c4b3cba79c896c1193
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout cc183652bf6e1273e985e1c4b3cba79c896c1193 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA xarray/tests/test_dataset.py
git checkout cc183652bf6e1273e985e1c4b3cba79c896c1193 
