#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff a061ada48efccf0845acae17009553e01764452b
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout a061ada48efccf0845acae17009553e01764452b 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/preprocessing/tests/test_discretization.py
git checkout a061ada48efccf0845acae17009553e01764452b 
