#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff f8c43aca467b7b0c4bb0a7fa41362f90b610b8df
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout f8c43aca467b7b0c4bb0a7fa41362f90b610b8df 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 aggregation.tests
git checkout f8c43aca467b7b0c4bb0a7fa41362f90b610b8df 
