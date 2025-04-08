#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff ee36e101e8f8c0acde4bb148b738ab7034e902a0
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout ee36e101e8f8c0acde4bb148b738ab7034e902a0 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 xor_lookups.tests
git checkout ee36e101e8f8c0acde4bb148b738ab7034e902a0 
