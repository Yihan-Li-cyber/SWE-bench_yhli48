#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 754b487f4d892e3d4872b6fc7468a71db4e31c13
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 754b487f4d892e3d4872b6fc7468a71db4e31c13 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA tests/config/test_config.py
git checkout 754b487f4d892e3d4872b6fc7468a71db4e31c13 
