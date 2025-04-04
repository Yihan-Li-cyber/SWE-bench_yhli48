#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff a41edc7bf5302f2ea327943c0c48c532b12009bc
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout a41edc7bf5302f2ea327943c0c48c532b12009bc 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA xarray/tests/test_merge.py
git checkout a41edc7bf5302f2ea327943c0c48c532b12009bc 
