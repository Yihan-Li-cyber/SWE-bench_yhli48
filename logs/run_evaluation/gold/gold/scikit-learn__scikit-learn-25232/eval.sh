#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff f7eea978097085a6781a0e92fc14ba7712a52d75
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout f7eea978097085a6781a0e92fc14ba7712a52d75 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/impute/tests/test_impute.py
git checkout f7eea978097085a6781a0e92fc14ba7712a52d75 
