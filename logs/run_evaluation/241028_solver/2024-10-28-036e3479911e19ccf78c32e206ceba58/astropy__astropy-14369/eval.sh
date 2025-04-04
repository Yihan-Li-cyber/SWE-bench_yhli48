#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff fa4e8d1cd279acf9b24560813c8652494ccd5922
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test] --verbose
git checkout fa4e8d1cd279acf9b24560813c8652494ccd5922 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA astropy/units/tests/test_format.py
git checkout fa4e8d1cd279acf9b24560813c8652494ccd5922 
