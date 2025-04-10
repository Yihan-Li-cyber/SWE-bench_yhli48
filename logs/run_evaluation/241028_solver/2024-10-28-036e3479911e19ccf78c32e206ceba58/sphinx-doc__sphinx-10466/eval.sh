#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff cab2d93076d0cca7c53fac885f927dde3e2a5fec
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout cab2d93076d0cca7c53fac885f927dde3e2a5fec 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/test_build_gettext.py
git checkout cab2d93076d0cca7c53fac885f927dde3e2a5fec 
