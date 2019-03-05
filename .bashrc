source /usr/share/defaults/etc/profile
export EDITOR='vim'
set editing-mode vi
set -o vi
stty -ixon
eval `dircolors $HOME/.dir_colors/dircolors`
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# alias md5dir='$HOME/scripts/md5dir.sh'
alias grep='grep -P --color=always'
#source ~/.pyenv/bin/activate
#tmux

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/kchuangk/Documents/Classes/W261 - Machine Learning at Scale/google-cloud-sdk/path.bash.inc' ]; then . '/home/kchuangk/Documents/Classes/W261 - Machine Learning at Scale/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/kchuangk/Documents/Classes/W261 - Machine Learning at Scale/google-cloud-sdk/completion.bash.inc' ]; then . '/home/kchuangk/Documents/Classes/W261 - Machine Learning at Scale/google-cloud-sdk/completion.bash.inc'; fi
