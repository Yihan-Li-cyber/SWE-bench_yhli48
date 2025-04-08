#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 1f8c4d9eb185c16a2c1d881c054f015e1c2eb334
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 1f8c4d9eb185c16a2c1d881c054f015e1c2eb334 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA tests/config/test_config.py
git checkout 1f8c4d9eb185c16a2c1d881c054f015e1c2eb334 
