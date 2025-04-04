#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 09786a173e7a0a488f46dd6000177c23e5d24eed
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 09786a173e7a0a488f46dd6000177c23e5d24eed 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/utilities/tests/test_codegen.py
git checkout 09786a173e7a0a488f46dd6000177c23e5d24eed 
