alias in_odoo='docker exec -it odoo_environment bash'
alias odoo='cd /home/soporte/Documentos/odoo-docker-server'
alias db_odoo='psql -h localhost -p 5432 -U odoo -d odoo'
alias co='git checkout '
alias br='git branch '
alias log='git log '
alias st='git status '
alias backup_odoo='psql -h localhost -p 5432 -U odoo -d '
alias start_odoo='./odoo/odoo-bin -c config/.odoo_config --db-filter=prod_2 -d prod_2 -u all --without-demo=ALL --stop-after-init '
alias update_odoo='cd /home/soporte/Documentos/odoo-docker-server/addons && ./update_git_repos.sh  && ./install_requirements_git_repos.sh'
alias update_users='update res_users set password = "admin"';
alias odoo_code='cd /home/soporte/Documentos/odoo-docker-server/addons/benandfrank && git branch'
alias add_alias='cd && gedit .bashrc'

