#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 6bb2b855498b5c68d7cca8cceb710365d58e6048
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 6bb2b855498b5c68d7cca8cceb710365d58e6048 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA xarray/tests/test_computation.py
git checkout 6bb2b855498b5c68d7cca8cceb710365d58e6048 
