#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 7269fa3e33e8d02485a647da91a5a2a60a06af61
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test] --verbose
git checkout 7269fa3e33e8d02485a647da91a5a2a60a06af61 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA astropy/io/ascii/tests/test_qdp.py
git checkout 7269fa3e33e8d02485a647da91a5a2a60a06af61 
