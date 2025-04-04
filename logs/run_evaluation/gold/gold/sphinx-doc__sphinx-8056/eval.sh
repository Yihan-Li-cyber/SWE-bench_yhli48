#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff e188d56ed1248dead58f3f8018c0e9a3f99193f7
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout e188d56ed1248dead58f3f8018c0e9a3f99193f7 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/test_ext_napoleon_docstring.py
git checkout e188d56ed1248dead58f3f8018c0e9a3f99193f7 
