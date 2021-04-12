# Plugins ----------------------------------------------------------------------
source ~/dotfiles/zplug/init.zsh

eval "$(starship init zsh)"

zplug "plugins/git",   from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "b4b4r07/enhancd", use:init.sh

zplug "stedolan/jq", \
    from:gh-r, \
    as:command, \
    rename-to:jq

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose

# History ----------------------------------------------------------------------

if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.history
fi

HISTSIZE=10000
SAVEHIST=10000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

# Path -------------------------------------------------------------------------
export PATH=$PATH:$HOME/bin:$HOME/.fzf/bin:~/.local/bin:/usr/local/opt/llvm/bin
export PATH=$PATH:$HOME/src/flutter/bin
export GOPATH=$HOME

# Aliases ----------------------------------------------------------------------
alias ll="ls -lah"
alias l="ls"
alias mkdir="mkdir -p"

alias v="nvim"
alias m="make"
alias d="docker"
alias emacs="TERM=xterm-24bits emacs -nw"
alias ls="lsd"
alias cat="bat"

# Settings ---------------------------------------------------------------------
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export RUST_SRC_PATH=$HOME/src/rust/src

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin:$HOME/.cargo/bin"

# History stuff
export ZSH_HISTORY_FILE="$HOME/.zsh_history.db"
export ZSH_HISTORY_FILTER="fzy:fzf:peco:percol"
export ZSH_HISTORY_KEYBIND_GET_BY_DIR="^r"
export ZSH_HISTORY_KEYBIND_GET_ALL="^r^a"
export ZSH_HISTORY_KEYBIND_SCREEN="^r^r"
export ZSH_HISTORY_KEYBIND_ARROW_UP="^p"
export ZSH_HISTORY_KEYBIND_ARROW_DOWN="^n"

# Added by Krypton
export GPG_TTY=$(tty)
export TERM=xterm-256color
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export GO111MODULE=on
export PATH="$HOME/Library/Python/3.7/bin:$PATH"
export PATH="$HOME/.fastlane/bin:$PATH"
export PATH="$(yarn global bin):$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source $HOME/.cargo/env

eval "$(atuin init)"
