#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 00ea883ef56fb5e092cbe4a6f7ff2e7470886ac4
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 00ea883ef56fb5e092cbe4a6f7ff2e7470886ac4 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 invalid_models_tests.test_models m2m_through.models m2m_through.tests
git checkout 00ea883ef56fb5e092cbe4a6f7ff2e7470886ac4 
