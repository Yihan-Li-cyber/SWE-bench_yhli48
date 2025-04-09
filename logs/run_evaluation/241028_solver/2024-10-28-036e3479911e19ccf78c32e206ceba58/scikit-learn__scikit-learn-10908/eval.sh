#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 67d06b18c68ee4452768f8a1e868565dd4354abf
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout 67d06b18c68ee4452768f8a1e868565dd4354abf 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/feature_extraction/tests/test_text.py
git checkout 67d06b18c68ee4452768f8a1e868565dd4354abf 
