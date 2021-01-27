# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias cls='clear'

LS_COLORS=$LS_COLORS:'di=0;35:' ; export LS_COLORS

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

eval "$(lua //home/z.lua/z.lua --init bash)"

if [ -d "/home/.local/vim/bin" ] ; then
	PATH="/home/.local/vim/bin:$PATH"
fi

if [ -d "/home/.local/ctags/bin" ] ; then
	PATH="/home/.local/ctags/bin:$PATH"
fi

if [ -d "/home/cmake/bin" ] ; then
	PATH="/home/cmake/bin:$PATH"
fi

if [ -d "/home/.local/bin" ] ; then
	PATH="/home/.local/bin:$PATH"
fi

if [ -d "/root/.cargo/bin" ] ; then
	PATH="/root/.cargo/bin:$PATH"
fi
