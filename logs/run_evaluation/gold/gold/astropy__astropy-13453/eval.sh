#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 19cc80471739bcb67b7e8099246b391c355023ee
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test] --verbose
git checkout 19cc80471739bcb67b7e8099246b391c355023ee 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA astropy/io/ascii/tests/test_html.py
git checkout 19cc80471739bcb67b7e8099246b391c355023ee 
