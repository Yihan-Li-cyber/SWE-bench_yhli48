#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 41fef6f1352be994cd90056d47440fe9aa4c068f
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 41fef6f1352be994cd90056d47440fe9aa4c068f 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA xarray/tests/test_indexes.py
git checkout 41fef6f1352be994cd90056d47440fe9aa4c068f 
