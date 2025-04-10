#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 567ff22716ac258b9edd2c1711d766b440ac0b11
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout 567ff22716ac258b9edd2c1711d766b440ac0b11 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/test_domain_py.py
git checkout 567ff22716ac258b9edd2c1711d766b440ac0b11 
