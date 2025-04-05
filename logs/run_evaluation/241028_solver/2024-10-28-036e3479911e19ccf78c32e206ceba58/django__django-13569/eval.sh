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
git diff 257f8495d6c93e30ab0f52af4c488d7344bcf112
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 257f8495d6c93e30ab0f52af4c488d7344bcf112 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 aggregation.tests
git checkout 257f8495d6c93e30ab0f52af4c488d7344bcf112 
