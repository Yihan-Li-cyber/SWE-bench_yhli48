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
git diff e28671187903e6aca2428374fdd504fca3032aee
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout e28671187903e6aca2428374fdd504fca3032aee 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 i18n.patterns.tests i18n.patterns.urls.default urlpatterns.path_urls urlpatterns.tests urlpatterns_reverse.tests
git checkout e28671187903e6aca2428374fdd504fca3032aee 
