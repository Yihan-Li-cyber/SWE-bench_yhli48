#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff a7b8b9e9e16d4e15fabda5ae615086c2e1c47d8a
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout a7b8b9e9e16d4e15fabda5ae615086c2e1c47d8a 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/linear_model/tests/test_least_angle.py
git checkout a7b8b9e9e16d4e15fabda5ae615086c2e1c47d8a 
