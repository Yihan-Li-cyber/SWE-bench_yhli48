#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 31eba1a76dd485dc633cae48227b46879eda5df4
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout 31eba1a76dd485dc633cae48227b46879eda5df4 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/test_directive_code.py
git checkout 31eba1a76dd485dc633cae48227b46879eda5df4 
