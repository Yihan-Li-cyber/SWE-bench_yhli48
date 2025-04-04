#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 9988d5ce267bf0df4791770b469431b1fb00dcdd
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout 9988d5ce267bf0df4791770b469431b1fb00dcdd 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/roots/test-ext-autodoc/target/docstring_signature.py tests/test_ext_autodoc_configs.py
git checkout 9988d5ce267bf0df4791770b469431b1fb00dcdd 
