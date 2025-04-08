#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff fbe850106b2e4b85f838219cb9e1df95fba6c164
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout fbe850106b2e4b85f838219cb9e1df95fba6c164 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 responses.test_fileresponse
git checkout fbe850106b2e4b85f838219cb9e1df95fba6c164 
