#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 955e54221008aba577ecbaefa15679f6777d3bf8
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 955e54221008aba577ecbaefa15679f6777d3bf8 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA testing/code/test_code.py testing/code/test_excinfo.py testing/conftest.py testing/test_reports.py
git checkout 955e54221008aba577ecbaefa15679f6777d3bf8 
