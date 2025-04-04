#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 60a7bd89860e504c0c33b02c78edcac87f6d1b5a
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 60a7bd89860e504c0c33b02c78edcac87f6d1b5a 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 auth_tests.test_forms
git checkout 60a7bd89860e504c0c33b02c78edcac87f6d1b5a 
