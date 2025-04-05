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
git diff 335c9c94acf263901fb023404408880245b0c4b4
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 335c9c94acf263901fb023404408880245b0c4b4 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 model_forms.models model_forms.test_modelchoicefield model_forms.tests
git checkout 335c9c94acf263901fb023404408880245b0c4b4 
