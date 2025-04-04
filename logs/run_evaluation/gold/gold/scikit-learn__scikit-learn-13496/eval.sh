#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 3aefc834dce72e850bff48689bea3c7dff5f3fad
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout 3aefc834dce72e850bff48689bea3c7dff5f3fad 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/ensemble/tests/test_iforest.py
git checkout 3aefc834dce72e850bff48689bea3c7dff5f3fad 
