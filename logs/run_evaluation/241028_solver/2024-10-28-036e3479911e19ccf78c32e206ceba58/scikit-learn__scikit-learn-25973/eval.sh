#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 10dbc142bd17ccf7bd38eec2ac04b52ce0d1009e
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout 10dbc142bd17ccf7bd38eec2ac04b52ce0d1009e 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/feature_selection/tests/test_sequential.py
git checkout 10dbc142bd17ccf7bd38eec2ac04b52ce0d1009e 
