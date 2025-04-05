#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
export LANG=en_US.UTF-8
export LANGUAGE=en_US:en
export LC_ALL=en_US.UTF-8
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 67f9d076cfc1858b94f9ed6d1a5ce2327dcc8d0d
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 67f9d076cfc1858b94f9ed6d1a5ce2327dcc8d0d 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 lookup.models lookup.tests
git checkout 67f9d076cfc1858b94f9ed6d1a5ce2327dcc8d0d 
