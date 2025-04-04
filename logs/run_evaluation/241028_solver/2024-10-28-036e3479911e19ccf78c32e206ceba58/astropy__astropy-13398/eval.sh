#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 6500928dc0e57be8f06d1162eacc3ba5e2eff692
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test] --verbose
git checkout 6500928dc0e57be8f06d1162eacc3ba5e2eff692 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA astropy/coordinates/tests/test_intermediate_transformations.py
git checkout 6500928dc0e57be8f06d1162eacc3ba5e2eff692 
