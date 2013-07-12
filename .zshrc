# Use fasd
eval "$(/opt/local/bin/fasd --init auto)"

# Use Emacs mode
bindkey -e
bindkey "^[[3~" delete-char

# Prompt
export PROMPT="%n@%m:%d
=> "
#export PS1='[\u@${HOSTNAME}:\[\033[33m\w\033[0m\]]\n${PROMPT} '
#export PS1="[\u@${HOSTNAME}:\[\033[33m\w\033[0m\]]\n${PROMPT} "

# Default Editor
export EDITOR=vim

# Aliases
source $HOME/.aliases

# HOME Dirs
OCTAVE_HOME=/Applications/Octave.app/Contents/Resources/bin
JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
MACPORTS_HOME=/opt/local/bin/
GRADLE_HOME=/opt/local/share/java/gradle
SCALA_HOME=/opt/local/share/scala-2.10/bin
HASKELL_HOME=$HOME/Library/Haskell/bin
GROOVY_HOME=$HOME/Software/groovy-1.8.6
RVM_SCRIPTS_HOME=$HOME/.rvm/scripts/bin/
GIT_HOME=/Applications/Xcode.app/Contents/Developer/usr/libexec/git-core/
XCODE_HOME=/Applications/Xcode.app/Contents/Developer/usr/bin/
HOME_BIN=$HOME/bin/

# Create PATH
export PATH="/opt/local/bin:$PATH"
export PATH="/opt/local/sbin:$PATH"
export PATH="$OCTAVE_HOME:$PATH"
export PATH="$GROOVY_HOME/bin/:$PATH"
export PATH="$GIT_HOME:$PATH"
export PATH="$MACPORTS_HOME:$PATH"
export PATH="$XCODE_HOME:$PATH"
export PATH="$HASKELL_HOME:$PATH"
export PATH="$SCALA_HOME:$PATH"
export PATH="$RVM_SCRIPTS_HOME:$PATH"
export PATH="$HOME_BIN:$PATH"
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

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
