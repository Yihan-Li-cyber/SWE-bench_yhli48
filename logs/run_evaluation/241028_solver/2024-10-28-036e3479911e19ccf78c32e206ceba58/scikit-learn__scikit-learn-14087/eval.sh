#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff a5743ed36fbd3fbc8e351bdab16561fbfca7dfa1
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout a5743ed36fbd3fbc8e351bdab16561fbfca7dfa1 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/linear_model/tests/test_logistic.py
git checkout a5743ed36fbd3fbc8e351bdab16561fbfca7dfa1 
