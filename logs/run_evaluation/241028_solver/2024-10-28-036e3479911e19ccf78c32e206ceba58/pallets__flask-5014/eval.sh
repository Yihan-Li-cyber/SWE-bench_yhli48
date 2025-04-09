#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 7ee9ceb71e868944a46e1ff00b506772a53a4f1d
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 7ee9ceb71e868944a46e1ff00b506772a53a4f1d 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA tests/test_blueprints.py
git checkout 7ee9ceb71e868944a46e1ff00b506772a53a4f1d 
