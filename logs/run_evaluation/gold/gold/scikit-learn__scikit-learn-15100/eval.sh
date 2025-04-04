#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff af8a6e592a1a15d92d77011856d5aa0ec4db4c6c
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout af8a6e592a1a15d92d77011856d5aa0ec4db4c6c 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/feature_extraction/tests/test_text.py
git checkout af8a6e592a1a15d92d77011856d5aa0ec4db4c6c 
