#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff a62775e99f2a5ea3d51db7160fad783f6cd8a4c5
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout a62775e99f2a5ea3d51db7160fad783f6cd8a4c5 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/tests/test_pipeline.py
git checkout a62775e99f2a5ea3d51db7160fad783f6cd8a4c5 
