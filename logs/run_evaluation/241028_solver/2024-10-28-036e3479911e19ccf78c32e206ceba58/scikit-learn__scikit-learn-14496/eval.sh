#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff d49a6f13af2f22228d430ac64ac2b518937800d0
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout d49a6f13af2f22228d430ac64ac2b518937800d0 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/cluster/tests/test_optics.py
git checkout d49a6f13af2f22228d430ac64ac2b518937800d0 
