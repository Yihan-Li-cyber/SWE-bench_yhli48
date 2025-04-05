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
git diff f2051eb8a7febdaaa43bd33bf5a6108c5f428e59
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout f2051eb8a7febdaaa43bd33bf5a6108c5f428e59 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 invalid_models_tests.test_models
git checkout f2051eb8a7febdaaa43bd33bf5a6108c5f428e59 
