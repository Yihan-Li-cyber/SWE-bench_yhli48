#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 553b5fb8f84ba05c8397f26dd079deece2b05029
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout 553b5fb8f84ba05c8397f26dd079deece2b05029 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/model_selection/tests/test_search.py
git checkout 553b5fb8f84ba05c8397f26dd079deece2b05029 
