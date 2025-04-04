#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 37c5b8c07be104fd5288cd87f101e48cb7a40298
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 37c5b8c07be104fd5288cd87f101e48cb7a40298 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 template_tests.filter_tests.test_floatformat
git checkout 37c5b8c07be104fd5288cd87f101e48cb7a40298 
