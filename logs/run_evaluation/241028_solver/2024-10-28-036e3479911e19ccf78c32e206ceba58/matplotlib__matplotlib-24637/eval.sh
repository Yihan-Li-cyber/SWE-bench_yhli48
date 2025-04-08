#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff a9ba9d5d3fe9d5ac15fbdb06127f97d381148dd0
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout a9ba9d5d3fe9d5ac15fbdb06127f97d381148dd0 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_backend_svg.py
git checkout a9ba9d5d3fe9d5ac15fbdb06127f97d381148dd0 
