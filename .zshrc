export ZSH="/home/reagan/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zshmarks)

source $ZSH/oh-my-zsh.sh
PATH=$HOME/.local/bin:$PATH

alias tmux="TERM=screen-256color-bce tmux"
alias python=python3
alias pip=pip3
alias ls="ls -G --color"
alias ni="npm install"
alias ns="npm start"
alias nb="npm run build"
alias gs="git status"
alias ga="git add -A"
alias gc="git commit"
alias gp="git push"
alias gu="gitupdate ."
alias rmn="rm -rf node_modules && [ ! -e package-lock.json ] || rm package-lock.json && [ ! -e yarn.lock ] || rm yarn.lock"
alias edithost="sudo vim /private/etc/hosts"

export EDITOR='vim'

# Start tmux when opening shell
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
      exec tmux
fi
