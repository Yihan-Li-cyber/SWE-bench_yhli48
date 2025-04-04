#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 1e2ccd8f0eca0870cf6f8fce6934e2da8eba9b72
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout 1e2ccd8f0eca0870cf6f8fce6934e2da8eba9b72 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/roots/test-linkcheck-localserver/conf.py tests/roots/test-linkcheck-localserver/index.rst tests/test_build_linkcheck.py
git checkout 1e2ccd8f0eca0870cf6f8fce6934e2da8eba9b72 
