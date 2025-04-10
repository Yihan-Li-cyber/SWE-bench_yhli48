#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 06107f838c28ab6ca6bfc2cc208e15997fcb2146
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout 06107f838c28ab6ca6bfc2cc208e15997fcb2146 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/test_domain_py.py
git checkout 06107f838c28ab6ca6bfc2cc208e15997fcb2146 
