#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 26224d96066b5c60882296c551f54ca7732c0af0
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 26224d96066b5c60882296c551f54ca7732c0af0 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_text.py
git checkout 26224d96066b5c60882296c551f54ca7732c0af0 
