#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 1c8668b0a021832386470ddf740d834e02c66f69
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout 1c8668b0a021832386470ddf740d834e02c66f69 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/mixture/tests/test_bayesian_mixture.py sklearn/mixture/tests/test_gaussian_mixture.py
git checkout 1c8668b0a021832386470ddf740d834e02c66f69 
