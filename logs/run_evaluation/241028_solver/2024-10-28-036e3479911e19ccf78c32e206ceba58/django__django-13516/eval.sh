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
git diff b7da588e883e12b8ac3bb8a486e654e30fc1c6c8
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout b7da588e883e12b8ac3bb8a486e654e30fc1c6c8 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 user_commands.management.commands.outputwrapper user_commands.tests
git checkout b7da588e883e12b8ac3bb8a486e654e30fc1c6c8 
