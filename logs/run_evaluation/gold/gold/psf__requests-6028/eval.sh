#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 0192aac24123735b3eaf9b08df46429bb770c283
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install .
git checkout 0192aac24123735b3eaf9b08df46429bb770c283 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA tests/test_utils.py
git checkout 0192aac24123735b3eaf9b08df46429bb770c283 
