#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 2e506c5ab457cba743bb47eb5b8c8eb9dd51d23d
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout 2e506c5ab457cba743bb47eb5b8c8eb9dd51d23d 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/test_domain_cpp.py
git checkout 2e506c5ab457cba743bb47eb5b8c8eb9dd51d23d 
