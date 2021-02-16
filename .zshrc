# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/reagan/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

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
alias gc="gitmoji -c"
alias gp="git push"
alias rmn="rm -rf node_modules"
alias edithost="sudo vim /private/etc/hosts"

export EDITOR='vim'

# Start tmux when opening shell
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
      exec tmux
fi
