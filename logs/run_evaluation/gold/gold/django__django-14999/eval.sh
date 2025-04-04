#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff a754b82dac511475b6276039471ccd17cc64aeb8
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout a754b82dac511475b6276039471ccd17cc64aeb8 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 migrations.test_operations
git checkout a754b82dac511475b6276039471ccd17cc64aeb8 
