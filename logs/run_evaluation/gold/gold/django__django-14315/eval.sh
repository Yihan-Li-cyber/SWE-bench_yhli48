#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 187118203197801c6cb72dc8b06b714b23b6dd3d
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 187118203197801c6cb72dc8b06b714b23b6dd3d 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 backends.base.test_client dbshell.test_postgresql
git checkout 187118203197801c6cb72dc8b06b714b23b6dd3d 
