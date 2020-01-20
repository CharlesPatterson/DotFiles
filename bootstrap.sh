#!/bin/bash
SCREENSHOTS_DIRECTORY=~/Documents/Screenshots

# Install homebrew
if [ -z $(which brew) ];
then
	echo "Installing brew..."
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Disable the console 'Last Login' message
if [ ! -f ~/.hushlogin ];
then
	echo "Disabling console 'Last Login' message"
	touch ~/.hushlogin
fi

if [ ! -f ~/.showhiddenfiles ]; 
then
	echo "Enabling show all hidden files"
	defaults write com.apple.Finder AppleShowAllFiles true
	touch ~/.showhiddenfiles
fi

# Change default screenshot save location
if [ ! -d $SCREENSHOTS_DIRECTORY ]; then
	echo "Changing default screenshots directory to: $SCREENSHOTS_DIRECTORY"
	mkdir -p $SCREENSHOTS_DIRECTORY
	defaults write com.apple.screencapture location $SCREENSHOTS_DIRECTORY
fi 

brews=(
	lsd
	rg
	tree
	wget
	git
    nvm
	tmux
	tmuxinator
)

casks=(
	1Password
	alacritty
	clipy
	dropbox
	fantastical
	firefox
	flux
    little-snitch
	omnifocus
	slack
	spectacle
	spotify
    steam
	visual-studio-code
)

echo "Installing/Upgrading brews..."
for ibrew in ${brews[@]}; do
    brew ls --versions ${ibrew} && brew upgrade ${ibrew} || brew install ${ibrew}
done

echo "Installing/Upgrading casks..."
for icask in ${casks[@]}; do
    brew cask ls --versions ${cask} && brew cask upgrade ${cask} || brew cask install ${cask}
done

if [ ! -d ~/Source ];
then
	echo "Creating a source directory"
	mkdir -p ~/Source/
fi

if [ ! -d ~/.config/alacritty ];
then
	echo "Creating alacritty config directory"
	mkdir -p ~/.config/alacritty
fi

if [ ! -d ~/.nvm ];
then
    echo "Creating .nvm directory"
    mkdir ~/.nvm
fi

if [ ! -d ~/.vim/autoload/plug.vim ];
then
    echo "Installing VIM plugin installer"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    echo "Installing VIM plugins"
    # Install vim plugins
    vim +PlugInstall +qall

    mkdir -p ~/.vim/undodir/
fi

# Manual Steps
## Mac System
### General Preferences
#### Disable Recent Items
### Finder
#### Disable colored tags
#### Disable Recents
#### Enable home screen in sidebar
#### Enable root drive in sidebar 
#### Enable showing filename extensions
### MenuBar
#### Turn on hiding
### Enable 
## 1Password
### Open and login for first time using phone QR code
## Alacritty
### Change to Solarized Dark theme
## Clipy
### Open and enable on system startup
### Give it accessibility permissions
## Slack
### Login to slacks
## Spectacle
### Open and enable on system startup
### Give it accessibility permissions
## Spotify
### Sign in to spotify
## Flux
### Open and enable on system startup
## Firefox
### Install dark reader extension
### Install vimium FF extension
### Install 1Password extension
### Install ublock origin extension
### Install HTTPS Everywhere extension
### Install Simple Tab Groups extension
### Change Firefox to default browser
### Change FF default search engine to DuckDuckGo
### Enable Restore previous session
### Disable all Home Content except Web Search
### Disable Ask to save logins and passwords for websites
### Disable Firefox Data Collection and Use
## Mail
### Setup gmail account
## Github
### Generate new SSH key and add to personal github
## CLI
### Copy .aliases from dotfiles
### Copy .zshrc from dotfiles
### Copy .tmux from dotfiles
### Copy .vimrc from dotfiles
## VS Code
### Install vim extension
### Set VS Code theme to Solarized Dark
