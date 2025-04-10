#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 768da1c6f6ec907524b8ebbf6bf818c92b56101b
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 768da1c6f6ec907524b8ebbf6bf818c92b56101b 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/algebras/tests/test_quaternion.py
git checkout 768da1c6f6ec907524b8ebbf6bf818c92b56101b 
