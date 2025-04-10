#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 4b6273b87442a4437d8b3873ea3022ae163f4fdf
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -v --no-use-pep517 --no-build-isolation -e .
git checkout 4b6273b87442a4437d8b3873ea3022ae163f4fdf 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA sklearn/ensemble/_hist_gradient_boosting/tests/test_gradient_boosting.py
git checkout 4b6273b87442a4437d8b3873ea3022ae163f4fdf 
