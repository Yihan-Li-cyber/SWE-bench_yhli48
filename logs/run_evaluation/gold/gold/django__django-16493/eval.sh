#!/bin/bash
set -uxo pipefail
source /opt/miniconda3/bin/activate
conda activate testbed
cd /testbed
git config --global --add safe.directory /testbed
cd /testbed
git status
git show
git diff e3a4cee081cf60650b8824f0646383b79cb110e7
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout e3a4cee081cf60650b8824f0646383b79cb110e7 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 file_storage.models file_storage.tests
git checkout e3a4cee081cf60650b8824f0646383b79cb110e7 
