#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff 33b47e4bd60e2302e42616141e76285038b724d6
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 33b47e4bd60e2302e42616141e76285038b724d6 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
PYTHONWARNINGS='ignore::UserWarning,ignore::SyntaxWarning' bin/test -C --verbose sympy/sets/tests/test_sets.py
git checkout 33b47e4bd60e2302e42616141e76285038b724d6 
