#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff c0a24c1dc957a3b565294213f435fefb2ec99714
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test] --verbose
git checkout c0a24c1dc957a3b565294213f435fefb2ec99714 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA astropy/io/fits/tests/test_diff.py
git checkout c0a24c1dc957a3b565294213f435fefb2ec99714 
