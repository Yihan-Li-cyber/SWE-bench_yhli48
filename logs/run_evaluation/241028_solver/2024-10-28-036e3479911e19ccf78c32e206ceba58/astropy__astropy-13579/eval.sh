#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 0df94ff7097961e92fd7812036a24b145bc13ca8
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test] --verbose
git checkout 0df94ff7097961e92fd7812036a24b145bc13ca8 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA astropy/wcs/wcsapi/wrappers/tests/test_sliced_wcs.py
git checkout 0df94ff7097961e92fd7812036a24b145bc13ca8 
