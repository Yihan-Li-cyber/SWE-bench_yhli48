#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 88e67a54b7ed0210c11523a337b498aadb2f5187
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 88e67a54b7ed0210c11523a337b498aadb2f5187 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 model_forms.tests
git checkout 88e67a54b7ed0210c11523a337b498aadb2f5187 
