#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff bfc4a566423e036fbdc9fb02765fd893e4860c85
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout bfc4a566423e036fbdc9fb02765fd893e4860c85 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/tests/test_base.py
git checkout bfc4a566423e036fbdc9fb02765fd893e4860c85 
