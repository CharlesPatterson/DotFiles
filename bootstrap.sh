#!/bin/bash
# TODO: SSH Keys
# TODO: Sync browser passwords/history
# TODO: Sync mail configuration/passwords
# TODO: Configure iTerm (+Color-scheme)
# TODO: Configure vim plugins
# TODO: Configure emacs plugins
# TODO: Pull down dotfiles
# TODO: Install Cisco VPN
# TODO: Download specific dash docs
# TODO: Create symlinks for configuration files

# Install Apple Updates
softwareupdate --install --all

# Install Xcode
if [ -z `which gcc` ];
then
    xcode-select --install
else
    echo "Xcode is already installed."
fi

# Install Brew
if [ -z `which brew` ];
then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Brew is already installed."
fi

brew update
brew link libyaml

brews=(
  # Languages
  python
  node
  leiningen
  ghc 
  cabal-install
  groovy
  erlang
  # Misc Tools
  ack
  coreutils
  findutils
  fasd
  #rsync
  trash
  tree
  wget
  zsh
  # Source Control
  git
  svn
  # Editors
  emacs
  vim
)

echo "Installing brews..."
brew install ${brews[@]}

if [ -z `which zsh` ];
then
    echo "Changing default shell to zsh."
    chsh -s /bin/zsh
fi

brew install caskroom/cask/brew-cask

apps=(
  alfred
  clipmenu
  menubar-countdown
  spectacle
  flux
  iterm2
  dropbox
  google-chrome
  firefox
  slack
  skype
  utorrent
  dash
  eclipse-ide
  mou
  qlcolorcode
  qlmarkdown
  qlstephen
  quicklook-json
  chromecast
  flash
  vlc
  spotify
  chicken
  virtualbox
  vagrant
  arq
  nvalt
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "Installing apps."
brew cask install --appdir="/Applications" ${apps[@]}

# Link apps with Alfred
brew cask alfred link

# Remove cached downloads
brew cleanup

# Install vim plugins
vim +PluginInstall +qall
