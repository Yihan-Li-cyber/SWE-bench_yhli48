#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 0b31e024873681e187b574fe1c4afe5e48aeeecf
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 0b31e024873681e187b574fe1c4afe5e48aeeecf 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 template_tests.test_autoreloader
git checkout 0b31e024873681e187b574fe1c4afe5e48aeeecf 
