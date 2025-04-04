#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff f35d2a6cc726f97d0e859ca7a0e1729f7da8a6c8
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout f35d2a6cc726f97d0e859ca7a0e1729f7da8a6c8 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/roots/test-toctree-index/conf.py tests/roots/test-toctree-index/foo.rst tests/roots/test-toctree-index/index.rst tests/test_environment_toctree.py
git checkout f35d2a6cc726f97d0e859ca7a0e1729f7da8a6c8 
