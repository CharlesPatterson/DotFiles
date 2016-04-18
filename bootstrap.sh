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
# TODO: Add yasnippets from work

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
  antlr
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
  neovim
  # External Tools
  awscli
  awsebcli
  docker
  boot2docker
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
  dockertoolbox
  visualvm
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
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install vim plugins
vim +PlugInstall +qall
nvim +PlugInstall +qall
mkdir -p ~/.vim/undodir/

# Enable emacs to start as a daemon by adding it to the launchagents
# You can manually run this with:
# sudo launchctl load -w /Library/LaunchAgents/gnu.emacs.daemon.plist
sudo cp gnu.emacs.daemon.plist /Library/LaunchAgents/
