#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff e3d1f9ac39e4bf0f31430e779acc50fb05fe1b64
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout e3d1f9ac39e4bf0f31430e779acc50fb05fe1b64 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/ensemble/tests/test_iforest.py
git checkout e3d1f9ac39e4bf0f31430e779acc50fb05fe1b64 
