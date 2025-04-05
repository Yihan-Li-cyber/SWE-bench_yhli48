#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
export LANG=en_US.UTF-8
export LANGUAGE=en_US:en
export LC_ALL=en_US.UTF-8
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff e64c1d8055a3e476122633da141f16b50f0c4a2d
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout e64c1d8055a3e476122633da141f16b50f0c4a2d 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 backends.sqlite.tests
git checkout e64c1d8055a3e476122633da141f16b50f0c4a2d 
