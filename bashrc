#odoo 

alias in_odoo='docker exec -it odoo_environment bash'
alias update_odoo='cd /home/soporte/Documentos/odoo-docker-server/addons && ./update_git_repos.sh  && ./install_requirements_git_repos.sh'
alias rebase_odoo='git rebase origin/12.0'

#posgres
alias db_odoo='psql -h localhost -p 5432 -U odoo -d odoo'
alias backup_odoo='psql -h localhost -p 5432 -U odoo -d '
alias update_users='update res_users set password = "admin"';

#git 
alias co='git checkout '
alias br='git branch '
alias log='git log '
alias st='git status '
alias oneline='git log --oneline'


#docker 
alias start_odoo='./odoo/odoo-bin -c config/.odoo_config --db-filter=prod_2 -d prod_2 -u all --without-demo=ALL --stop-after-init '


#shurt links
alias odoo_code='cd /home/soporte/Documentos/odoo-docker-server/addons/benandfrank && git branch'
alias add_alias='cd && gedit .bashrc'
alias odoo='cd /home/soporte/Documentos/odoo-docker-server'


