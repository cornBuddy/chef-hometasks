name 'app_server'
description 'A role to install, configure and start application server'
run_list 'recipe[task1_jboss::install]', 'recipe[task1_jboss::configure]',
         'recipe[task1_jboss::deploy]'
