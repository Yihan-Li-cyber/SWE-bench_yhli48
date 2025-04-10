#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 37b0e66c871e8fb032a9c7086b2a1d5419838154
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout 37b0e66c871e8fb032a9c7086b2a1d5419838154 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/linear_model/tests/test_huber.py
git checkout 37b0e66c871e8fb032a9c7086b2a1d5419838154 
