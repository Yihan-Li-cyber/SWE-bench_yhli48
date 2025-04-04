#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 80c3854a5f4f4a6ab86c03d9db7854767fcd83c1
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test] --verbose
git checkout 80c3854a5f4f4a6ab86c03d9db7854767fcd83c1 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA astropy/io/fits/tests/test_header.py
git checkout 80c3854a5f4f4a6ab86c03d9db7854767fcd83c1 
