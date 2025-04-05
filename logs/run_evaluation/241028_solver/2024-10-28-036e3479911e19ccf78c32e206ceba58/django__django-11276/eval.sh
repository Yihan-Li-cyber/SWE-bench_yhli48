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
git diff 28d5262fa3315690395f04e3619ed554dbaf725b
source /opt/miniconda3/bin/activate
conda activate testbed
python -m pip install -e .
git checkout 28d5262fa3315690395f04e3619ed554dbaf725b 
git apply -v - <<'EOF_114329324912'

EOF_114329324912
./tests/runtests.py --verbosity 2 --settings=test_sqlite --parallel 1 admin_docs.test_views auth_tests.test_forms forms_tests.tests.test_forms forms_tests.widget_tests.base forms_tests.widget_tests.test_clearablefileinput model_forms.tests template_tests.filter_tests.test_addslashes template_tests.filter_tests.test_make_list template_tests.filter_tests.test_title template_tests.filter_tests.test_urlize template_tests.syntax_tests.test_url utils_tests.test_html view_tests.tests.test_csrf view_tests.tests.test_debug
git checkout 28d5262fa3315690395f04e3619ed554dbaf725b 
