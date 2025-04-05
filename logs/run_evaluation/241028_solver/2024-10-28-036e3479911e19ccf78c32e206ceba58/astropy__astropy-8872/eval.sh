#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff b750a0e6ee76fb6b8a099a4d16ec51977be46bf6
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test] --verbose
git checkout b750a0e6ee76fb6b8a099a4d16ec51977be46bf6 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA astropy/units/tests/test_quantity.py
git checkout b750a0e6ee76fb6b8a099a4d16ec51977be46bf6 
