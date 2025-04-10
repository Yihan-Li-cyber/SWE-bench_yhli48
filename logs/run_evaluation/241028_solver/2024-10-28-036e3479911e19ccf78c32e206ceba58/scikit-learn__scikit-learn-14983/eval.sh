#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 06632c0d185128a53c57ccc73b25b6408e90bb89
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout 06632c0d185128a53c57ccc73b25b6408e90bb89 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/model_selection/tests/test_split.py
git checkout 06632c0d185128a53c57ccc73b25b6408e90bb89 
