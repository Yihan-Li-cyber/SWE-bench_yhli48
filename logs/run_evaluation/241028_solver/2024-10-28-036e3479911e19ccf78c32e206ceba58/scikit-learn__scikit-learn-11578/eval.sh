#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff dd69361a0d9c6ccde0d2353b00b86e0e7541a3e3
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout dd69361a0d9c6ccde0d2353b00b86e0e7541a3e3 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/linear_model/tests/test_logistic.py
git checkout dd69361a0d9c6ccde0d2353b00b86e0e7541a3e3 
