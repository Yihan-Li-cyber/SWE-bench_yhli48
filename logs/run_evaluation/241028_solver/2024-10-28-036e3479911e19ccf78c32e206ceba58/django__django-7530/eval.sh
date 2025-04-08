#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PYTHONIOENCODING=utf8
export LANGUAGE=en_US:en
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff f8fab6f90233c7114d642dfe01a4e6d4cb14ee7d
source /opt/miniconda3/bin/activate
conda activate testbed
python setup.py install
git checkout f8fab6f90233c7114d642dfe01a4e6d4cb14ee7d 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 migrations.test_commands
git checkout f8fab6f90233c7114d642dfe01a4e6d4cb14ee7d 
