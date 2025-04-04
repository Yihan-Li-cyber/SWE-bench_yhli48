#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 39de9a2698ad4bb90681c0fdb70b30a78233145f
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 39de9a2698ad4bb90681c0fdb70b30a78233145f 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/physics/hep/tests/test_gamma_matrices.py
git checkout 39de9a2698ad4bb90681c0fdb70b30a78233145f 
