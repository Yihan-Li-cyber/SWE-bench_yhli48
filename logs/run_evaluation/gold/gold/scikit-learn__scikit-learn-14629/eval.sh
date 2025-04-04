#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 4aded39b5663d943f6a4809abacfa9cae3d7fb6a
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout 4aded39b5663d943f6a4809abacfa9cae3d7fb6a 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/tests/test_multioutput.py
git checkout 4aded39b5663d943f6a4809abacfa9cae3d7fb6a 
