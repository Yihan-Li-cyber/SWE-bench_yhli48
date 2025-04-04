#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff d687febce5868545f99974d2499a91f81a32fef5
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout d687febce5868545f99974d2499a91f81a32fef5 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 modeladmin.tests
git checkout d687febce5868545f99974d2499a91f81a32fef5 
