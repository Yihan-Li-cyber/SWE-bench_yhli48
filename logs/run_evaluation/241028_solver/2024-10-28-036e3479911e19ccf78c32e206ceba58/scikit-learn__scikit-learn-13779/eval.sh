#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff b34751b7ed02b2cfcc36037fb729d4360480a299
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout b34751b7ed02b2cfcc36037fb729d4360480a299 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/ensemble/tests/test_voting.py
git checkout b34751b7ed02b2cfcc36037fb729d4360480a299 
