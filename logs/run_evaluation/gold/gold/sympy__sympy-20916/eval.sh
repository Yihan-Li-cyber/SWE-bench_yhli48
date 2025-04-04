#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 82298df6a51491bfaad0c6d1980e7e3ca808ae93
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 82298df6a51491bfaad0c6d1980e7e3ca808ae93 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/printing/tests/test_conventions.py sympy/testing/quality_unicode.py
git checkout 82298df6a51491bfaad0c6d1980e7e3ca808ae93 
