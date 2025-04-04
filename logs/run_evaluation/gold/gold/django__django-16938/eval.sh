#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 1136aa5005f0ae70fea12796b7e37d6f027b9263
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 1136aa5005f0ae70fea12796b7e37d6f027b9263 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 serializers.models.base serializers.test_json serializers.test_jsonl serializers.test_xml serializers.test_yaml serializers.tests
git checkout 1136aa5005f0ae70fea12796b7e37d6f027b9263 
