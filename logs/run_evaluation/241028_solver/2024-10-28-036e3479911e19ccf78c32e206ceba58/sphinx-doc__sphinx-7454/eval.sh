#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff aca3f825f2e4a8817190f3c885a242a285aa0dba
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout aca3f825f2e4a8817190f3c885a242a285aa0dba 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/test_domain_py.py
git checkout aca3f825f2e4a8817190f3c885a242a285aa0dba 
