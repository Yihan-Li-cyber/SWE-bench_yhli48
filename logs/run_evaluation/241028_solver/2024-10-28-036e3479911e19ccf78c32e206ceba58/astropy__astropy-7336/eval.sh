#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 732d89c2940156bdc0e200bb36dc38b5e424bcba
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test] --verbose
git checkout 732d89c2940156bdc0e200bb36dc38b5e424bcba 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA -vv -o console_output_style=classic --tb=no astropy/units/tests/test_quantity_annotations.py astropy/units/tests/test_quantity_decorator.py
git checkout 732d89c2940156bdc0e200bb36dc38b5e424bcba 
