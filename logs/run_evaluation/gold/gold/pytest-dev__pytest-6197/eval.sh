#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff e856638ba086fcf5bebf1bebea32d5cf78de87b4
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout e856638ba086fcf5bebf1bebea32d5cf78de87b4 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA testing/test_collection.py testing/test_skipping.py
git checkout e856638ba086fcf5bebf1bebea32d5cf78de87b4 
