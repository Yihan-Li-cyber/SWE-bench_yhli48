#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 5ec2bd279729ff534719b8bf238dbbca907b93c5
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 5ec2bd279729ff534719b8bf238dbbca907b93c5 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_mlab.py
git checkout 5ec2bd279729ff534719b8bf238dbbca907b93c5 
