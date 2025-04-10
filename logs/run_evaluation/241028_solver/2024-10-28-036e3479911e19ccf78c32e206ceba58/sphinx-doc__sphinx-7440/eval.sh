#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 9bb204dcabe6ba0fc422bf4a45ad0c79c680d90b
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout 9bb204dcabe6ba0fc422bf4a45ad0c79c680d90b 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/test_domain_std.py
git checkout 9bb204dcabe6ba0fc422bf4a45ad0c79c680d90b 
