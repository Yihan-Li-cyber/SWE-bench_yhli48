#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 6991880109e35c879b71b7d9d9c154baeec12b89
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 6991880109e35c879b71b7d9d9c154baeec12b89 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 schema.tests
git checkout 6991880109e35c879b71b7d9d9c154baeec12b89 
