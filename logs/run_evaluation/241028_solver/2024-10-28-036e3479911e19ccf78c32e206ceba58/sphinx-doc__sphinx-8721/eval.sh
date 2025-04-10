#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 82ef497a8c88f0f6e50d84520e7276bfbf65025d
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout 82ef497a8c88f0f6e50d84520e7276bfbf65025d 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/test_ext_viewcode.py
git checkout 82ef497a8c88f0f6e50d84520e7276bfbf65025d 
