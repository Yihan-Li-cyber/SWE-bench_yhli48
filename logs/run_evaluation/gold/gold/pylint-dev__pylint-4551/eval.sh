#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 99589b08de8c5a2c6cc61e13a37420a868c80599
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 99589b08de8c5a2c6cc61e13a37420a868c80599 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA tests/unittest_pyreverse_writer.py
git checkout 99589b08de8c5a2c6cc61e13a37420a868c80599 
