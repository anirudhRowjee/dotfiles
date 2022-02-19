# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/anirudh/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="afowler"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

set -o vi
alias mp3down="youtube-dl --extract-audio --audio-format mp3 -o '%(title)s.%(ext)s'"
alias actenv="source env/bin/activate"
alias makenv="virtualenv --python=python3 env"
alias readmd="clear && $HOME/scripts/mdreader.py"
alias greet="clear && fortune | cowsay | lolcat"
alias filezf="fzf --layout reverse --info inline --border  --preview 'pygmentize -f terminal {}' --preview-window right:60%:noborder --color 'fg:#bbccdd,fg+:#ddeeff,bg:#334455,preview-bg:#223344,border:#778899'"
alias noteman="./noteman.py"
alias dcrt="docker-compose run app sh -c 'python manage.py test'"
alias zathura="zathura -c .config/zathura/"
alias zaread="./~/scripts/zaread"
alias v="nvim"
alias e="nvim"
alias vt="vim -c ':term ++curwin'"
alias nv="nvim"
alias matlab="./matlab/bin/matlab"

# aliases for currently hot directories
alias goddcol="cd ~/college/sem3/CS206/"
alias goddco="cd ~/college/sem3/CS201/"
alias gowt="cd ~/college/sem3/CS204/"
alias godsal="cd ~/college/sem3/CS207/"
alias goafll="cd ~/college/sem3/CS205/"
alias godsa="cd ~/college/sem3/CS202/"
alias gosds="cd ~/college/sem3/CS203/"
alias goclg="cd ~/college/sem3/"
alias ctl="setxkbmap -option ctrl:nocaps"

alias minecraft="java -jar ~/minecraft/TLauncher-2.8.jar"
alias jflap="java -jar ~/jflap/JFLAP7.1.jar"

alias j="./scripts/dir-switcher.sh"
alias p="python3"
alias t="tmux"

export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

# camera toggle
alias camtoggle="pkill -f /dev/video0 || mpv --geometry=-0-0 --autofit=30% /dev/video0"

# added by travis gem
[ ! -s /home/anirudh/.travis/travis.sh ] || source /home/anirudh/.travis/travis.sh

# fzf ripgrep
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'


export PATH=$PATH:/home/$USER/chomper/bin
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export VISUAL="nvim"
export EDITOR="nvim"

# rust
# export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/.cargo/bin"

# go
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init -)"
fi
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"

man() {
  GROFF_NO_SGR=1 \
  LESS_TERMCAP_md=$'\e[1;31m' \
  LESS_TERMCAP_me=$'\e[0m' \
  LESS_TERMCAP_us=$'\e[1;34m' \
  LESS_TERMCAP_ue=$'\e[0m' \
  LESS_TERMCAP_so=$'\e[1;35m' \
  LESS_TERMCAP_se=$'\e[0m' \
  command man "$@"
}

# npm stuff
export PATH="$PATH:/usr/lib/.npm-packages/bin"

# shortcut command to write every day
alias vw="nvim -c ':call WriteMode()'"
alias write="cd ~/write && vw $(date +%F).md "
alias goproxy="gowt && cd projects/proxy/source"

# start starship
# eval "$(starship init zsh)"
export PATH=”$HOME/.emacs.d/bin:$PATH”
