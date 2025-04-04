#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 004b4620f6f4ad87261e149898940f2dcd5757ef
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 004b4620f6f4ad87261e149898940f2dcd5757ef 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 decorators.tests
git checkout 004b4620f6f4ad87261e149898940f2dcd5757ef 
