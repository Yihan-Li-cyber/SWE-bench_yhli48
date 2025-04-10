#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff fdbaa58acbead5a254f2e6d597dc1ab3b947f4c6
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout fdbaa58acbead5a254f2e6d597dc1ab3b947f4c6 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/svm/tests/test_svm.py
git checkout fdbaa58acbead5a254f2e6d597dc1ab3b947f4c6 
