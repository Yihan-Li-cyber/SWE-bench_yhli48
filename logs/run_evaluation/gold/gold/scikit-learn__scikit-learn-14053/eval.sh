#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 6ab8c86c383dd847a1be7103ad115f174fe23ffd
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout 6ab8c86c383dd847a1be7103ad115f174fe23ffd 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/tree/tests/test_export.py
git checkout 6ab8c86c383dd847a1be7103ad115f174fe23ffd 
