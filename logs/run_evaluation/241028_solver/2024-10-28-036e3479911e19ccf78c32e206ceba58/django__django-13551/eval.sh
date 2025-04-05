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
git diff 7f9e4524d6b23424cf44fbe1bf1f4e70f6bb066e
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 7f9e4524d6b23424cf44fbe1bf1f4e70f6bb066e 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 auth_tests.models.__init__ auth_tests.models.with_custom_email_field auth_tests.test_models auth_tests.test_tokens
git checkout 7f9e4524d6b23424cf44fbe1bf1f4e70f6bb066e 
