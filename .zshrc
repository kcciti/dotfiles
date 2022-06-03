# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n] confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

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
export PATH=$HOME/.local/bin:$PATH
eval "$(pyenv init --path)"

# aliases

# if [[ -f /run/.containerenv && -f /run/.toolboxenv ]]; then
# else
  alias nvim="toolbox run --container nvim nvim"
  alias R="toolbox run --container R R"
  alias rstudio="toolbox run --container R rstudio"
  alias gnome-tweaks="toolbox run --container gnome-tools gnome-tweaks"
  alias pdflatex="toolbox run --container latex pdflatex"
  alias borg='toolbox run --container borg export BORG_PASSWDCOMMAND="cat /home/kchuangk/.borg-passphrase" && /usr/bin/borg'
  alias sshfs="toolbox run --container sshfs  sshfs"
# fi



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
alias ipython='ipython --no-autoindent --TerminalInteractiveShell.editing_mode=vi '
# alias borg='export BORG_PASSCOMMAND="cat /home/kchuangk/.borg-passphrase" borg'
bindkey "^R" history-incremental-search-backward



source <(antibody init)
# antibody bundle zdharma/fast-syntax-highlighting
antibody bundle zsh-users/zsh-autosuggestions
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down
# antibody bundle zsh-users/zsh-history-substring-search
antibody bundle zsh-users/zsh-completions
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

# source ~/.venv/bin/activate  # commented out by conda initialize
export LD_LIBRARY_PATH="/usr/lib64/R/lib"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH":/usr/local/cuda/lib64

export VISUAL=vim
export EDITOR="$VISUAL"

export BORG_PASSCOMMAND="cat $HOME/.borg-passphrase"
# export BORG_CONFIG_DIR="$HOME/.config/borg"

# export TERM="xterm-256color"

if [[ -f /run/.containerenv && -f /run/.toolboxenv ]]; then
else
if which tmux 2>&1 >/dev/null; then
    if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
       if [ -z "$TMUX" ]; then
               (tmux attach -t main || tmux new -s main); exit
       fi
    fi
fi
fi

# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='~~'

# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# (EXPERIMENTAL) Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    export|unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
    ssh)          fzf "$@" --preview 'dig {}' ;;
    *)            fzf "$@" ;;
  esac
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/kchuangk/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/kchuangk/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/kchuangk/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/kchuangk/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<
#
# sl`
# poetry shell

# Alias for toolbox


toolbox() {
    if [[ $@ =~ (enter) && ! $@ =~ (-r|--release|-d|--distro) ]]; then

        CONTAINER=$(sed -E -e 's/enter|--container|-c|toolbox|\t|\n|\s//g' <<< $@)

        if [[ ! -z ${CONTAINER} && ${CONTAINER} =~ "^[a-zA-Z0-9-]{1,15}$" ]]; then
            command toolbox --container ${CONTAINER} run sudo hostname ${CONTAINER}
            command toolbox enter ${CONTAINER}
        else
            command toolbox enter
        fi
    else
        command toolbox $@
    fi
}
