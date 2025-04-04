#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 40cc2ffd7887959157aaf469e09585ec2be7f528
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 40cc2ffd7887959157aaf469e09585ec2be7f528 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA tests/checkers/unittest_similar.py
git checkout 40cc2ffd7887959157aaf469e09585ec2be7f528 
