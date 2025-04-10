#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff ec9af606c6cfa515f946d74da9b51574f2f9b16f
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .[test]
git checkout ec9af606c6cfa515f946d74da9b51574f2f9b16f 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
tox --current-env -epy39 -v -- tests/test_ext_autodoc_mock.py
git checkout ec9af606c6cfa515f946d74da9b51574f2f9b16f 
