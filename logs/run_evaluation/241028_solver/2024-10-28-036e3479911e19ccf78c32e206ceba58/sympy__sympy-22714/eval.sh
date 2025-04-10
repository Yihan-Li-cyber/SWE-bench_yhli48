#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 3ff4717b6aef6086e78f01cdfa06f64ae23aed7e
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 3ff4717b6aef6086e78f01cdfa06f64ae23aed7e 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/geometry/tests/test_point.py
git checkout 3ff4717b6aef6086e78f01cdfa06f64ae23aed7e 
