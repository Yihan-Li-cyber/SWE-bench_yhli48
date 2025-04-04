#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 3a668ea6ff24b0c8f00498c3144c63bac561d925
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 3a668ea6ff24b0c8f00498c3144c63bac561d925 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA testing/test_collection.py
git checkout 3a668ea6ff24b0c8f00498c3144c63bac561d925 
