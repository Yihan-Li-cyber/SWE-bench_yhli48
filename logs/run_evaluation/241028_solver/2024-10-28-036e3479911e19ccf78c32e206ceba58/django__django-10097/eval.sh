#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PYTHONIOENCODING=utf8
export LANGUAGE=en_US:en
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff b9cf764be62e77b4777b3a75ec256f6209a57671
source /opt/miniconda3/bin/activate
conda activate testbed
python setup.py install
git checkout b9cf764be62e77b4777b3a75ec256f6209a57671 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1
git checkout b9cf764be62e77b4777b3a75ec256f6209a57671 
