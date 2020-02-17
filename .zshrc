#" Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

#  # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
#  # Initialization code that may require console input (password prompts, [y/n]
#  # confirmations, etc.) must go above this block, everything else may go below.
#  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#  fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# # confirmations, etc.) must go above this block, everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
# 

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/apps/zotero:$HOME/apps/zoom:$PATH
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
# zstyle :compinstall filename '/home/kchuangk/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
alias ls="ls --color"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias grep='grep -P --color=always'
bindkey "^R" history-incremental-search-backward

export TERM="xterm-256color"
if which tmux 2>&1 >/dev/null; then
   if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
       if [ -z "$TMUX" ]; then
             tmux attach -t main || tmux new -s main ; exit

       fi
   fi
fi


source <(antibody init)
antibody bundle zdharma/fast-syntax-highlighting
# antibody bundle zsh-users/zsh-autosuggestions
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down
# antibody bundle zsh-users/zsh-history-substring-search
antibody bundle zsh-users/zsh-completions
antibody bundle shanedabes/zsh-tmux 
# antibody bundle jiahut/agnoster-plus.zsh-theme
antibody bundle romkatv/powerlevel10k

#
#
# antibody bundle fsegouin/oh-my-zsh-agnoster-mod-theme
# ZSH_THEME="powerlevel10k"
# setopt inc_append_history
# setopt hist_ignore_dups
# setopt hist_ignore_space
# setopt share_history

# antibody bundle bhilburn/powerlevel9k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
source ~/.venv/bin/activate
