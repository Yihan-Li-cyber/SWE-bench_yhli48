#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 212fd67b9f0b4fae6a7c3501fdf1a9a5b2801329
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout 212fd67b9f0b4fae6a7c3501fdf1a9a5b2801329 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/test_util_inspect.py
git checkout 212fd67b9f0b4fae6a7c3501fdf1a9a5b2801329 
