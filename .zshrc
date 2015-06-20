# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks"
#ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git svn)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Use fasd
eval "$(/usr/local/bin/fasd --init auto)"

# Use Emacs mode
bindkey -e
bindkey "^[[3~" delete-char

# Prompt
#export PROMPT="%n@%m:%d
#=> "
#export PS1='[\u@${HOSTNAME}:\[\033[33m\w\033[0m\]]\n${PROMPT} '
#export PS1="[\u@${HOSTNAME}:\[\033[33m\w\033[0m\]]\n${PROMPT} "

# Default Editor
export EDITOR=vim

# Aliases
source $HOME/.aliases

# HOME Dirs
MAVEN_HOME=/Users/cpatterson/Shared/maven/apache-maven-3.0.4/bin
#JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands/
GROOVY_HOME=$HOME/Software/groovy-1.8.6
GIT_HOME=/Applications/Xcode.app/Contents/Developer/usr/libexec/git-core/
XCODE_HOME=/Applications/Xcode.app/Contents/Developer/usr/bin/
HOME_BIN=$HOME/bin/

# Create PATH
export PATH="/opt/local/bin:$PATH"
export PATH="/opt/local/sbin:$PATH"
export PATH="$MAVEN_HOME:$PATH"
export PATH="$GROOVY_HOME/bin/:$PATH"
export PATH="$GIT_HOME:$PATH"
export PATH="$XCODE_HOME:$PATH"
export PATH="$HOME_BIN:$PATH"
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
PYTHONPATH="/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages:${PYTHONPATH}"
PYTHONPATH="/opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/:$PYTHONPATH"
export PYTHONPATH

##### ZSH-Specific Features #####

# Enable enhanced auto-completion
autoload -U compinit
compinit
setopt completeinword

# Tab-completion is case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Tab-completion for killall
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

# Display CPU usage stats for commands taking more than 10 seconds
REPORTTIME=10

# Type directories without cd as default
setopt auto_cd

# History is 10,000 entries, shared with other terminal sessions
HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=10000
setopt incappendhistory 
setopt sharehistory
setopt extendedhistory

# Use auto-renaming to hostnames for tmux
case "$TERM" in
    screen*)
        PROMPT_COMMAND="printf '\033k$(hostname)\033\\';"${PROMPT_COMMAND}
        ;;
esac

# Maven needs substantial memory to compile projects
export MAVEN_OPTS=-Xmx512m

# Include autojump functionality
export FPATH="$FPATH:/opt/local/share/zsh/site-functions/"
if [ -f /opt/local/etc/profile.d/autojump.zsh ]; then
    . /opt/local/etc/profile.d/autojump.zsh
fi

# Include fasd functionality
eval "$(fasd --init auto)"
