#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff cdb66059a2feb44ee49021874605ba90801f9986
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test] --verbose
git checkout cdb66059a2feb44ee49021874605ba90801f9986 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA astropy/io/fits/tests/test_connect.py
git checkout cdb66059a2feb44ee49021874605ba90801f9986 
