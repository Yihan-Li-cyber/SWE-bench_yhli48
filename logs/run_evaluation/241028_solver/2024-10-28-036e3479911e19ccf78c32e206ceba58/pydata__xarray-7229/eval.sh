#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 3aa75c8d00a4a2d4acf10d80f76b937cadb666b7
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 3aa75c8d00a4a2d4acf10d80f76b937cadb666b7 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA xarray/tests/test_computation.py
git checkout 3aa75c8d00a4a2d4acf10d80f76b937cadb666b7 
