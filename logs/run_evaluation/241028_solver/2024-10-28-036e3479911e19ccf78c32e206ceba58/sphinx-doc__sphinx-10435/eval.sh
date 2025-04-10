#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff f1061c012e214f16fd8790dec3c283d787e3daa8
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout f1061c012e214f16fd8790dec3c283d787e3daa8 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/test_build_latex.py
git checkout f1061c012e214f16fd8790dec3c283d787e3daa8 
