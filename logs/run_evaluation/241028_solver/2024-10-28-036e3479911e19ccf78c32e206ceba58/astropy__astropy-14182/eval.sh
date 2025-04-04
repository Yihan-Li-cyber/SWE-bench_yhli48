#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff a5917978be39d13cd90b517e1de4e7a539ffaa48
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test] --verbose
git checkout a5917978be39d13cd90b517e1de4e7a539ffaa48 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA astropy/io/ascii/tests/test_rst.py
git checkout a5917978be39d13cd90b517e1de4e7a539ffaa48 
