set editing-mode vi
set -o vi

alias dot='/usr/bin/git --git-dir=/home/kchuangk/.dotfiles/ --work-tree=/home/kchuangk'

if [ -z "$VIRTUAL_ENV" ]; then
    read -p "Virtual Environment? " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        export VIRTUAL_ENV=/home/kchuangk/.pyenv
    fi
fi

if [[ -n "$TMUX" ]]; then
    tmux set-environment VIRTUAL_ENV /home/kchuangk/.pyenv
fi

if [ -n "$VIRTUAL_ENV" ]; then
    source $VIRTUAL_ENV/bin/activate;
fi
