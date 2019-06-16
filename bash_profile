##################
# EXPORT VARIABLES
##################

# GIT
export GIT_EDITOR=vim

### aliases
alias ls='ls -GFh'
alias vi='vim'

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

export PS1="\h:\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\]$ "
