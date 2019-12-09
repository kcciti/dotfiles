source /usr/share/defaults/etc/profile
export EDITOR='vim'
export LANG="en_US.UTF-8"
set editing-mode vi
export PATH=$HOME/bin:/usr/local/bin:$HOME/apps/zotero:$HOME/apps/zoom:$PATH
set -o vi
stty -ixon
eval `dircolors $HOME/.dir_colors/dircolors`
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# alias md5dir='$HOME/scripts/md5dir.sh'
alias grep='grep -P --color=always'
# source ~/.pyenv/bin/activate
# tmux



