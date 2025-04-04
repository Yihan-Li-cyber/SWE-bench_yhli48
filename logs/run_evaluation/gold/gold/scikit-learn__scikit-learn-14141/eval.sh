#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 3d997697fdd166eff428ea9fd35734b6a8ba113e
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout 3d997697fdd166eff428ea9fd35734b6a8ba113e 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/utils/tests/test_show_versions.py
git checkout 3d997697fdd166eff428ea9fd35734b6a8ba113e 
