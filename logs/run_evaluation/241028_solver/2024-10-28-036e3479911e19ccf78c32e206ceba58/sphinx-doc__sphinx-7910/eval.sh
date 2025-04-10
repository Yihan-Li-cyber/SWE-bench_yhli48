#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 27ac10de04697e2372d31db5548e56a7c6d9265d
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout 27ac10de04697e2372d31db5548e56a7c6d9265d 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- sphinx/testing/util.py tests/test_ext_napoleon.py
git checkout 27ac10de04697e2372d31db5548e56a7c6d9265d 
