#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff ca80f03a43bc39e4cc2c67dc99817b3c9f13b8a6
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout ca80f03a43bc39e4cc2c67dc99817b3c9f13b8a6 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA tests/test_pylint_runners.py
git checkout ca80f03a43bc39e4cc2c67dc99817b3c9f13b8a6 
