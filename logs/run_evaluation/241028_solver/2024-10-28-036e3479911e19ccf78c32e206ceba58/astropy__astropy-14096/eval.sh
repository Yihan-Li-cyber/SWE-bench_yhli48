#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 1a4462d72eb03f30dc83a879b1dd57aac8b2c18b
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test] --verbose
git checkout 1a4462d72eb03f30dc83a879b1dd57aac8b2c18b 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA astropy/coordinates/tests/test_sky_coord.py
git checkout 1a4462d72eb03f30dc83a879b1dd57aac8b2c18b 
