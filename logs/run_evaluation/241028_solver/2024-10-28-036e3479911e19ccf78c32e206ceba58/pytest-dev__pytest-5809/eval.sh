#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 8aba863a634f40560e25055d179220f0eefabe9a
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 8aba863a634f40560e25055d179220f0eefabe9a 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA testing/test_pastebin.py
git checkout 8aba863a634f40560e25055d179220f0eefabe9a 
