#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# GIT
export GIT_EDITOR=vim

alias ls='ls -CF --color=auto'
PS1='[\u@\h \W]\$ '
alias vi='vim'

alias m=less
alias view='vim -R'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias open='xdg-open &> /dev/null'

export PATH="${HOME}/bin:${PATH}"

# This alias is one of my own making. It recursively searches the current directory and the contents
# of their files, listing out all instances of the found word (this is useful to find all usages of
# a function)
# usage: findall 'string'
# output: every line where 'string' is present, using grep on the file. therefore it adopts greps
# options.
#alias findall="find . ! \( -path './.*' -prune \) ! \( -iname 'tags' -or -iname '*.txt' -or -iname '*.md' -or -iname '*.htm' -or -iname '*.html' -or -iname 'Makefile*' -or -iname 'LICENSE' -or -iname 'README' -or -iname '*.png' \) -type f | xargs -0 grep"
alias findall="find . ! \( -path './.*' -prune \) ! \( -iname 'tags' -or -iname '*.txt' -or -iname '*.md' -or -iname 'Makefile*' -or -iname 'LICENSE' -or -iname 'README' \) -type f | xargs grep"

# Git branch in prompt.
# https://gist.github.com/joseluisq/1e96c54fa4e1e5647940

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# https://www.cyberciti.biz/tips/howto-linux-unix-bash-shell-setup-prompt.html
# [tardis:dirname HH:MM:SS] (branch)$
export PS1="[\h:\W \t]\[\033[32m\]\$(parse_git_branch)\[\033[00m\]$ "

if [[ -f ${HOME}/.git-completion.bash ]]
then
    . ${HOME}/.git-completion.bash
fi
