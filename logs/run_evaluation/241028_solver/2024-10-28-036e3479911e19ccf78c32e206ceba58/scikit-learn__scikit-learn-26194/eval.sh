#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff e886ce4e1444c61b865e7839c9cff5464ee20ace
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout e886ce4e1444c61b865e7839c9cff5464ee20ace 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/metrics/tests/test_ranking.py
git checkout e886ce4e1444c61b865e7839c9cff5464ee20ace 
