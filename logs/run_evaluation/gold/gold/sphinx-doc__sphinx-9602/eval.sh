#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 6c38f68dae221e8cfc70c137974b8b88bd3baaab
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout 6c38f68dae221e8cfc70c137974b8b88bd3baaab 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/test_domain_py.py
git checkout 6c38f68dae221e8cfc70c137974b8b88bd3baaab 
