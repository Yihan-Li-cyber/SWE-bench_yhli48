#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 7d5329852f19c6ae78c6f6f3d3e41835377bf295
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 7d5329852f19c6ae78c6f6f3d3e41835377bf295 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 bulk_create.models bulk_create.tests
git checkout 7d5329852f19c6ae78c6f6f3d3e41835377bf295 
