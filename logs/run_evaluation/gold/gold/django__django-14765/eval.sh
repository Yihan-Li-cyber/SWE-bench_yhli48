#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 4e8121e8e42a24acc3565851c9ef50ca8322b15c
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 4e8121e8e42a24acc3565851c9ef50ca8322b15c 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 migrations.test_state
git checkout 4e8121e8e42a24acc3565851c9ef50ca8322b15c 
