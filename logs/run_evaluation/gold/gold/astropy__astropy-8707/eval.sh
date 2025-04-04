#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff a85a0747c54bac75e9c3b2fe436b105ea029d6cf
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test] --verbose
git checkout a85a0747c54bac75e9c3b2fe436b105ea029d6cf 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA astropy/io/fits/tests/test_header.py
git checkout a85a0747c54bac75e9c3b2fe436b105ea029d6cf 
