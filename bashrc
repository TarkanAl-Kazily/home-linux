#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=vim
export GIT_EDITOR=vim
export VISUAL=vim

alias ls='ls -CF --color=auto'
alias vi='vim'
alias p8='ping 8.8.8.8'

alias view='vim -R'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias open='xdg-open &> /dev/null'

export PATH="${HOME}/bin:${PATH}"

# CUDA
export PATH="/opt/cuda/bin:${PATH}"

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
export PS1="\[\033[1m\][\[\033[1;31m\]\t\[\033[00;1m\] \h:\W]\[\033[0m\]\[\033[32m\] (master)\[\033[00m\]$ "

if [[ -f ${HOME}/.git-completion.bash ]]
then
    . ${HOME}/.git-completion.bash
fi
