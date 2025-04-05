#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 2c7846d992ca512d36a73f518205015c88ed088c
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 2c7846d992ca512d36a73f518205015c88ed088c 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 i18n.tests
git checkout 2c7846d992ca512d36a73f518205015c88ed088c 
