#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 903aaa35e5ceaa33bfc9b19b7f6da65ce5a91dd4
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 903aaa35e5ceaa33bfc9b19b7f6da65ce5a91dd4 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 model_forms.test_modelchoicefield
git checkout 903aaa35e5ceaa33bfc9b19b7f6da65ce5a91dd4 
