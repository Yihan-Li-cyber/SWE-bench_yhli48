#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 3eacf948e0f95ef957862568d87ce082f378e186
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout 3eacf948e0f95ef957862568d87ce082f378e186 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/cluster/tests/test_k_means.py
git checkout 3eacf948e0f95ef957862568d87ce082f378e186 
