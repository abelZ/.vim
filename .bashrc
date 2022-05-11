# .bashrc

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

eval "$(lua ~/z.lua/z.lua --init bash)"

. "/root/.local/share/lscolors.sh"

alias ftput='ft put -o -s work'
export CLE_TOKEN=ddafbc860585fa5d1e6cd9a1363bdc476708f37c
