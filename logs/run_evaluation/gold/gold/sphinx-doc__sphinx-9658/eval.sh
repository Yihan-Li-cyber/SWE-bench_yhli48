#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 232dbe41c5250eb7d559d40438c4743483e95f15
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout 232dbe41c5250eb7d559d40438c4743483e95f15 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/test_util_typing.py
git checkout 232dbe41c5250eb7d559d40438c4743483e95f15 
