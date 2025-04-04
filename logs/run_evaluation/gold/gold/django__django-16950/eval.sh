#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff f64fd47a7627ed6ffe2df2a32ded6ee528a784eb
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout f64fd47a7627ed6ffe2df2a32ded6ee528a784eb 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 model_formsets.test_uuid
git checkout f64fd47a7627ed6ffe2df2a32ded6ee528a784eb 
