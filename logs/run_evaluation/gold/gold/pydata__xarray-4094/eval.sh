#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff a64cf2d5476e7bbda099b34c40b7be1880dbd39a
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout a64cf2d5476e7bbda099b34c40b7be1880dbd39a 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA xarray/tests/test_dataset.py
git checkout a64cf2d5476e7bbda099b34c40b7be1880dbd39a 
