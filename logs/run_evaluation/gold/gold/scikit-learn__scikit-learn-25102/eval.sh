#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff f9a1cf072da9d7375d6c2163f68a6038b13b310f
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout f9a1cf072da9d7375d6c2163f68a6038b13b310f 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/feature_selection/tests/test_base.py sklearn/feature_selection/tests/test_feature_select.py
git checkout f9a1cf072da9d7375d6c2163f68a6038b13b310f 
