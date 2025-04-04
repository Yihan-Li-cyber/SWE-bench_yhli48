#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 493d608e39d32a67173c23a7bbc47d6bfedcef61
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 493d608e39d32a67173c23a7bbc47d6bfedcef61 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_axes.py
git checkout 493d608e39d32a67173c23a7bbc47d6bfedcef61 
