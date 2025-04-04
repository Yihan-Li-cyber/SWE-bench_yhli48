#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff a5e6a101869e027e7930e694f8b1cfb082603453
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout a5e6a101869e027e7930e694f8b1cfb082603453 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/core/tests/test_match.py sympy/polys/tests/test_polytools.py
git checkout a5e6a101869e027e7930e694f8b1cfb082603453 
