#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 273a8b25620467c1e5686aa8d2a1dbb8c02c78d0
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 273a8b25620467c1e5686aa8d2a1dbb8c02c78d0 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA tests/lint/unittest_lint.py tests/regrtest_data/directory/ignored_subdirectory/failing.py tests/test_self.py
git checkout 273a8b25620467c1e5686aa8d2a1dbb8c02c78d0 
