#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff bdb49c4abfb35554a3c8ce761696ffff3bb837fe
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout bdb49c4abfb35554a3c8ce761696ffff3bb837fe 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/utilities/tests/test_iterables.py
git checkout bdb49c4abfb35554a3c8ce761696ffff3bb837fe 
