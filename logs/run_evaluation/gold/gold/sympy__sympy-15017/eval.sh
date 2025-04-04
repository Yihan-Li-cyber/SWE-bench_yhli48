#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 6810dee426943c1a2fe85b5002dd0d4cf2246a05
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 6810dee426943c1a2fe85b5002dd0d4cf2246a05 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/tensor/array/tests/test_immutable_ndim_array.py
git checkout 6810dee426943c1a2fe85b5002dd0d4cf2246a05 
