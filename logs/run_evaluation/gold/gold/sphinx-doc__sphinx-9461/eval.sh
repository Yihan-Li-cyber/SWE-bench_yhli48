#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 939c7bb7ff7c53a4d27df067cea637540f0e1dad
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout 939c7bb7ff7c53a4d27df067cea637540f0e1dad 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/roots/test-ext-autodoc/target/properties.py tests/test_domain_py.py tests/test_ext_autodoc_autoclass.py tests/test_ext_autodoc_autoproperty.py
git checkout 939c7bb7ff7c53a4d27df067cea637540f0e1dad 
