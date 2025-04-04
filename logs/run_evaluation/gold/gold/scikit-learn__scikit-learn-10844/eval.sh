#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 97523985b39ecde369d83352d7c3baf403b60a22
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout 97523985b39ecde369d83352d7c3baf403b60a22 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/metrics/cluster/tests/test_supervised.py
git checkout 97523985b39ecde369d83352d7c3baf403b60a22 
