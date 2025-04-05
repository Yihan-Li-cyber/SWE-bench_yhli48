#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 39f83765e12b0e5d260b7939fc3fe281d879b279
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 39f83765e12b0e5d260b7939fc3fe281d879b279 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 template_tests.filter_tests.test_floatformat
git checkout 39f83765e12b0e5d260b7939fc3fe281d879b279 
