#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff a3f4ae6cd24d5ecdf49f213d77b3513dd509a06c
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test] --verbose
git checkout a3f4ae6cd24d5ecdf49f213d77b3513dd509a06c 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA astropy/io/fits/tests/test_header.py
git checkout a3f4ae6cd24d5ecdf49f213d77b3513dd509a06c 
