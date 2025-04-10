#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 07983a5a8704ad91ae855218ecbda1c8598200ca
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout 07983a5a8704ad91ae855218ecbda1c8598200ca 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/roots/test-ext-autodoc/target/private.py tests/test_ext_autodoc_private_members.py
git checkout 07983a5a8704ad91ae855218ecbda1c8598200ca 
