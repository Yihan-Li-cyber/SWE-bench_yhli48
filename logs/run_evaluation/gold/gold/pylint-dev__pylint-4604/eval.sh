#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 1e55ae64624d28c5fe8b63ad7979880ee2e6ef3f
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 1e55ae64624d28c5fe8b63ad7979880ee2e6ef3f 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA tests/checkers/unittest_variables.py
git checkout 1e55ae64624d28c5fe8b63ad7979880ee2e6ef3f 
