#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff b90661d6a46aa3619d3eec94d5281f5888add501
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout b90661d6a46aa3619d3eec94d5281f5888add501 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/linear_model/tests/test_ridge.py
git checkout b90661d6a46aa3619d3eec94d5281f5888add501 
