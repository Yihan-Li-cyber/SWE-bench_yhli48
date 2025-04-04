#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 6786f437df54ca7780a047203cbcfaa1db8dc542
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 6786f437df54ca7780a047203cbcfaa1db8dc542 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_widgets.py
git checkout 6786f437df54ca7780a047203cbcfaa1db8dc542 
