#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff aa55975c7d3f6c9f6d7f68accc41bb7cadf0eb9a
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout aa55975c7d3f6c9f6d7f68accc41bb7cadf0eb9a 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA testing/logging/test_fixture.py
git checkout aa55975c7d3f6c9f6d7f68accc41bb7cadf0eb9a 
