#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 30e123ed351317b7527f632b3b7dc4e81e850449
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 30e123ed351317b7527f632b3b7dc4e81e850449 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 model_fields.test_autofield model_options.test_default_pk
git checkout 30e123ed351317b7527f632b3b7dc4e81e850449 
