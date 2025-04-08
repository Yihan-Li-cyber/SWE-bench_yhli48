#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 3eadeacc06c9f2ddcdac6ae39819faa9fbee9e39
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 3eadeacc06c9f2ddcdac6ae39819faa9fbee9e39 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
pytest -rA lib/matplotlib/tests/test_rcparams.py
git checkout 3eadeacc06c9f2ddcdac6ae39819faa9fbee9e39 
