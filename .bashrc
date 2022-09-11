# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	  *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
# force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
	else
	color_prompt=
	fi
fi

if [ "$color_prompt" = yes ]; then
	PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$(git branch 2>/dev/null | grep '^*' | colrm 1 2) \$ "
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
	PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
	;;
*)
	;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#	sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
  fi
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

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
alias v="vim"
alias nv="nvim"
alias matlab="./matlab/bin/matlab"

# aliases for currently hot directories
alias goclg="cd ~/college/sem4/"

alias j="./scripts/dir-switcher.sh"
alias p="python3"
alias t="tmux"

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

export VISUAL=nvim
export EDITOR="$VISUAL"

# rust
export PATH="$HOME/.cargo/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 2>/dev/null 2>&1; then
 eval "$(pyenv init -)"
fi


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"


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

alias minecraft="java -jar ~/minecraft/TLauncher-2.8.jar"
alias jflap="java -jar ~/jflap/JFLAP7.1.jar"

export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

# fzf ripgrep
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

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
alias v="nvim"
alias o="./Obsidian-0.14.6.AppImage"
alias l="./Logseq-linux-x64-0.6.9.AppImage"

alias ctl="setxkbmap -option ctrl:nocaps"

alias gopvl="cd ~/pesu/pvl"
alias gohsp="cd ~/pesu/hackerspace_ecc/"

alias gompca="cd ~/college/sem4/CS252/"
alias godaa="cd ~/college/sem4/CS251/"
alias gocn="cd ~/college/sem4/CS254/"
alias goos="cd ~/college/sem4/CS253/"
alias gola="cd ~/college/sem4/MA251/"
alias gocie="cd ~/college/sem4/CIE_L1/"

alias c="goclg && ranger"
alias gomtc="cd ~/projects/mtc/"

# alias to compile and debug single assembly file
# after this, "target remote localhost:12345" "layout asm" "layout reg"
alias cda="~/scripts/debug_asm.sh"

# convert a document to PDF with some nice CSS
alias mkpdf="md2pdf --stylesheet https://unpkg.com/@picocss/pico@latest/css/pico.min.css"
alias armsim="~/armsim.sh"
alias fb="sudo brightnessctl s 120000"

export LC_CTYPE=en_US.UTF-8 
export PATH=/home/anirudh/.pyenv/bin:/home/anirudh/.pyenv/bin:/home/anirudh/.cargo/bin:/home/anirudh/.pyenv/bin:/home/anirudh/.cargo/bin:/home/anirudh/.local/bin:/home/anirudh/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin:/home/anirudh/.fzf/bin:/home/anirudh/chomper/bin:/usr/local/go/bin:/home/anirudh/go/bin:/usr/lib/.npm-packages/bin:/usr/local/go/bin

export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8
export PATH=/home/anirudh/.pyenv/bin:/home/anirudh/.pyenv/bin:/home/anirudh/.cargo/bin:/home/anirudh/.pyenv/bin:/home/anirudh/.cargo/bin:/home/anirudh/.local/bin:/home/anirudh/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin:/home/anirudh/.fzf/bin:/home/anirudh/chomper/bin:/usr/local/go/bin:/home/anirudh/go/bin:/usr/lib/.npm-packages/bin:/usr/local/go/bin:/usr/local/go/bin

alias sb='source ~/.bashrc'
alias python='python3'
# alias gp='cd ~/projects/dotslash-three/'
alias lg='lazygit'
alias hw="echo 'homebrew.hsp-ec.xyz' | cowsay | lolcat"
alias pr="pkill picom && picom -b && picom -b"
alias wall="ranger ~/Pictures/wallpapers"
alias p='tms && tmux attach'
alias sw='feh --bg-fill ~/Pictures/wallpapers/$(ls ~/Pictures/wallpapers/ | shuf -n 1)'
alias e='emacsclient -nw'
# export WAYLAND_DISPLAY="wayland-1"
export KUBECONFIG=/home/anirudh/kubeconfig.yaml

greet
export KUBECONFIG=/home/anirudh/o7-genesis-kubeconfig.yaml
