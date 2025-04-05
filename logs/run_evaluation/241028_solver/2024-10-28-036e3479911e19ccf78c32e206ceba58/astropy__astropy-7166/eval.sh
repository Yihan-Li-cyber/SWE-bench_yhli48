#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 26d147868f8a891a6009a25cd6a8576d2e1bd747
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test] --verbose
git checkout 26d147868f8a891a6009a25cd6a8576d2e1bd747 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA -vv -o console_output_style=classic --tb=no astropy/utils/tests/test_misc.py
git checkout 26d147868f8a891a6009a25cd6a8576d2e1bd747 
