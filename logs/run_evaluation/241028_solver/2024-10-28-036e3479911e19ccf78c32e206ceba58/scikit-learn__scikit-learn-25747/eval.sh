#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 2c867b8f822eb7a684f0d5c4359e4426e1c9cfe0
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout 2c867b8f822eb7a684f0d5c4359e4426e1c9cfe0 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/utils/tests/test_set_output.py
git checkout 2c867b8f822eb7a684f0d5c4359e4426e1c9cfe0 
