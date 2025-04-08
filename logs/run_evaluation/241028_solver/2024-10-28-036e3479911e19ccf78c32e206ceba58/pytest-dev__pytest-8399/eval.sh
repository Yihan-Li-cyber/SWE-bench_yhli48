#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 6e7dc8bac831cd8cf7a53b08efa366bd84f0c0fe
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 6e7dc8bac831cd8cf7a53b08efa366bd84f0c0fe 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA testing/test_nose.py testing/test_unittest.py
git checkout 6e7dc8bac831cd8cf7a53b08efa366bd84f0c0fe 
