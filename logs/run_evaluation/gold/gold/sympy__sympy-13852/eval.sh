#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff c935e1d106743efd5bf0705fbeedbd18fadff4dc
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout c935e1d106743efd5bf0705fbeedbd18fadff4dc 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/functions/special/tests/test_zeta_functions.py
git checkout c935e1d106743efd5bf0705fbeedbd18fadff4dc 
