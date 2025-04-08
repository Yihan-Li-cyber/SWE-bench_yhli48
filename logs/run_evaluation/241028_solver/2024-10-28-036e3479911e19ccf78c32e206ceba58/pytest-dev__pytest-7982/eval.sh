#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff a7e38c5c61928033a2dc1915cbee8caa8544a4d0
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout a7e38c5c61928033a2dc1915cbee8caa8544a4d0 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA testing/test_collection.py
git checkout a7e38c5c61928033a2dc1915cbee8caa8544a4d0 
