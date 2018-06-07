source /usr/share/defaults/etc/profile
export EDITOR='vim'
set editing-mode vi
set -o vi
stty -ixon
eval `dircolors $HOME/.dir_colors/dircolors`
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias md5dir='$HOME/scripts/md5dir.sh'
source ~/.pyenv/bin/activate
tmux
