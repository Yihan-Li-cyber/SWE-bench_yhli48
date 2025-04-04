#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff c4e40d991c28be51de9ac560ce895ac7f9b14924
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout c4e40d991c28be51de9ac560ce895ac7f9b14924 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA xarray/tests/test_variable.py
git checkout c4e40d991c28be51de9ac560ce895ac7f9b14924 
