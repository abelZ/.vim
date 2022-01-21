# .bashrc

# User specific aliases and functions

#alias rm='rm -i'
#alias cp='cp -i'
#alias mv='mv -i'

# Source global definitions
# if [ -n "$TMUX" ]; then
# if [ -f /etc/profile ]; then
	# echo $TMUX
	# export TERM=xterm-256color
	# PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/snap/bin"
	# PATH="/usr/bin:/usr/local/bin"
	# source /etc/profile
# fi

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

add_to_path() {
    local dir re

    for dir; do
        re="(^$dir:|:$dir:|:$dir$)"
        if ! [[ $PATH =~ $re ]]; then
            PATH="$PATH:$dir"
        fi
    done
}

add_to_path "$HOME/.local/bin"
add_to_path "$HOME/.ft"
add_to_path "$HOME/cpplint_scan/tool"
add_to_path "$HOME/.cargo/bin"
# ExtraPath="$HOME/.ft:$HOME/cpplint_scan/tool:$HOME/.local/bin:$HOME/.cargo/bin"
# PATH="$ExtraPath:$PATH"

eval "$(lua ~/z.lua/z.lua --init bash)"

. "/root/.local/share/lscolors.sh"
