#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 586f4318ffcdfbd9a1093f35ad43e81983740b66
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout 586f4318ffcdfbd9a1093f35ad43e81983740b66 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/compose/tests/test_column_transformer.py
git checkout 586f4318ffcdfbd9a1093f35ad43e81983740b66 
