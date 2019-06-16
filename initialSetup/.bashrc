#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -CF --color=auto'
alias m=less
alias vi=vim
alias view='vim -R'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias open='xdg-open &> /dev/null'

vl() {
    vlc -q "${1}" 2> /dev/null
}

mp() {
    mplayer -really-quiet "${1}" 2> /dev/null
}

PS1='[\u@\h \W]\$ '

export PATH="${HOME}/bin":"${HOME}/bin/cross-compile/arm-none-eabi/bin":"${HOME}/bin/JLink":"${PATH}"

# Enable VAAPI hardware acceleration via "VDPAU"
export VDPAU_DRIVER=va_gl

if [[ -f ${HOME}/.git-completion.bash ]]
then
    . ${HOME}/.git-completion.bash
fi
