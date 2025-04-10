#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff d360ffa7c5896a91ae498b3fb9cf464464ce8f34
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout d360ffa7c5896a91ae498b3fb9cf464464ce8f34 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/decomposition/tests/test_dict_learning.py
git checkout d360ffa7c5896a91ae498b3fb9cf464464ce8f34 
