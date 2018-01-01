set editing-mode vi
set -o vi

tmux list-sessions | grep -E -v '\(attached\)$' | while IFS='\n' read line; do
    tmux kill-session -t "${line%%:*}"
done

alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

if [ -z "$VIRTUAL_ENV" ]; then
    read -p "Virtual Environment? " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        export VIRTUAL_ENV=$HOME/.pyenv
    fi
fi

if [[ -n "$TMUX" ]]; then
    tmux set-environment VIRTUAL_ENV $HOME/.pyenv
fi

if [ -n "$VIRTUAL_ENV" ]; then
    source $VIRTUAL_ENV/bin/activate;
fi
