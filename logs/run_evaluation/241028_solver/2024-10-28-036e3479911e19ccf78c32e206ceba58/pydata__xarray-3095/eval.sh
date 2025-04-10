#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 1757dffac2fa493d7b9a074b84cf8c830a706688
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 1757dffac2fa493d7b9a074b84cf8c830a706688 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA xarray/tests/test_variable.py
git checkout 1757dffac2fa493d7b9a074b84cf8c830a706688 
