#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff dab48b7482295956973879d15bfd4d3bb0718772
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout dab48b7482295956973879d15bfd4d3bb0718772 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 inspectdb.models inspectdb.tests
git checkout dab48b7482295956973879d15bfd4d3bb0718772 
