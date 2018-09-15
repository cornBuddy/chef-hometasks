name 'web_server'
description 'A role to install, configure and start apache web server'
run_list 'recipe[task2_nginx]'
