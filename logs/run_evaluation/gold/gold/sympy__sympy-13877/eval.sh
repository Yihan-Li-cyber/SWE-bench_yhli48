#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 1659712001810f5fc563a443949f8e3bb38af4bd
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 1659712001810f5fc563a443949f8e3bb38af4bd 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/matrices/tests/test_matrices.py
git checkout 1659712001810f5fc563a443949f8e3bb38af4bd 
