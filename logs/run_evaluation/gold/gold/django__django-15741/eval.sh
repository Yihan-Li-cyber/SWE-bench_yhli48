#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 8c0886b068ba4e224dd78104b93c9638b860b398
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 8c0886b068ba4e224dd78104b93c9638b860b398 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 i18n.tests template_tests.filter_tests.test_date
git checkout 8c0886b068ba4e224dd78104b93c9638b860b398 
