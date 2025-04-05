#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff b16c7d12ccbc7b2d20364b89fb44285bcbfede54
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test] --verbose
git checkout b16c7d12ccbc7b2d20364b89fb44285bcbfede54 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA astropy/nddata/mixins/tests/test_ndarithmetic.py
git checkout b16c7d12ccbc7b2d20364b89fb44285bcbfede54 
