# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#odoo 

alias in_odoo='docker exec -it odoo_environment bash'
alias update_odoo='cd /home/soporte/Documentos/odoo-docker-server/addons && ./update_git_repos.sh  && ./install_requirements_git_repos.sh'
alias rebase_odoo='git rebase origin/12.0'
alias 12='odoo_code && co 12.0'

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
alias mixed='git reset --mixed '
alias nbranch_master='git checkout master && git pull origin master && git checkout -b '
alias pull_alias='repo_alias && git pull origin master && cp .bashrc /home/soporte'
alias amend='git commit --amend -m '
alias remote_update='git remote update'
alias push_bfd='git push -f bfd '


#docker 
alias start_odoo='./odoo/odoo-bin -c config/.odoo_config --db-filter=prod_2 -d prod_2 -u all --without-demo=ALL --stop-after-init '


#shurt links
alias odoo_code='cd /home/soporte/Documentos/odoo-docker-server/addons/benandfrank && git branch'
alias add_alias='cd && gedit .bashrc'
alias odoo='cd /home/soporte/Documentos/odoo-docker-server'
alias repo_alias='cd /home/soporte/Documentos/alias'
alias up_alias='cd && cp .bashrc /home/soporte/Documentos/alias && cd /home/soporte/Documentos/alias && git add . && git commit -m "[ADD]" && git push origin master'

alias up_alias_home='cd && cp .bashrc /home/arithgrey/Documentos/alias && cd /home/arithgrey/Documentos/alias && git add . && git commit -m "[ADD][home]" && git push origin master'

alias link_calendar='firefox --new-tab https://calendar.google.com/calendar/r?tab=wc&pli=1'
alias link_enid='firefox --new-tab http://enidservices.com/inicio/login/'
alias link_enid='firefox --new-tab http://enidservices.com/inicio/login/'
alias mis_mrs='firefox --new-tab https://git.vauxoo.com/benandfrank/benandfrank/merge_requests/'
alias runbot='firefox --new-tab https://runbot.vauxoo.com/runbot'

#home
alias enid='cd /var/www/html/inicio'
alias mysql_enid=' mysql -u root -p -D enidserv_web'
alias pull_enid='git checkout master && git reset --hard master && git pull origin master'
alias commit='git commit -m '
alias ip_enid='hostname -I'






