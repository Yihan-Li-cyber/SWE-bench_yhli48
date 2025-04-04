#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff dd528cb2cefc0db8b91a7ff0a2bc87305b976597
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout dd528cb2cefc0db8b91a7ff0a2bc87305b976597 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 template_tests.filter_tests.test_json_script utils_tests.test_html
git checkout dd528cb2cefc0db8b91a7ff0a2bc87305b976597 
