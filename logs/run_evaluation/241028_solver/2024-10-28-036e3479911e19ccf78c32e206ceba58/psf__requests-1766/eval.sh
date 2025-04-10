#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 847735553aeda6e6633f2b32e14ba14ba86887a4
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install .
git checkout 847735553aeda6e6633f2b32e14ba14ba86887a4 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA test_requests.py
git checkout 847735553aeda6e6633f2b32e14ba14ba86887a4 
