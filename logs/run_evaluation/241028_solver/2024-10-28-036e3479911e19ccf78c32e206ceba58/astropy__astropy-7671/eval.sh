#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff a7141cd90019b62688d507ae056298507678c058
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test] --verbose
git checkout a7141cd90019b62688d507ae056298507678c058 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA -vv -o console_output_style=classic --tb=no astropy/utils/tests/test_introspection.py
git checkout a7141cd90019b62688d507ae056298507678c058 
