#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff f387d024fc75569d2a4a338bfda76cc2f328f627
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout f387d024fc75569d2a4a338bfda76cc2f328f627 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 prefetch_related.tests
git checkout f387d024fc75569d2a4a338bfda76cc2f328f627 
