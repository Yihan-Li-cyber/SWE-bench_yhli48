#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 45814af6197cfd8f4dc72ee43b90ecde305a1d5a
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 45814af6197cfd8f4dc72ee43b90ecde305a1d5a 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 expressions.tests queries.test_q queryset_pickle.tests
git checkout 45814af6197cfd8f4dc72ee43b90ecde305a1d5a 
