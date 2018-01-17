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
  python3
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
  fzf
  rg
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

echo "Installing/Upgrading brews..."
#brew install ${brews[@]}
for individual_brew in ${brews[@]}; do
    brew ls --versions ${individual_brew} && brew upgrade ${individual_brew} || brew install ${individual_brew}
done

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
  sublime-text
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "Installing apps."
brew cask install --appdir="/Applications" ${apps[@]}

# Link apps with Alfred
brew cask alfred link

# Remove cached downloads
brew cleanup

# Lunchy (this lets you handle launchctl better)
gem install lunchy

# Install shell extensions for fzf
/usr/local/opt/fzf/install

# Install vim plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install vim plugins
vim +PlugInstall +qall
mkdir -p ~/.vim/undodir/

# Install neovim plugins
nvim +PlugInstall +qall
mkdir -p ~/.config/nvim/undodir/
cp init.vim ~/.config/nvim/
nvim +PlugInstall +qall

# Python2 integration for neovim
pip2 install --upgrade neovim

# Python3 integration for neovim
pip3 install --upgrade neovim

nvim +UpdateRemotePlugins +qall

# YouCompleteMe Installation for VIM
cd ~/.vim/plugged/YouCompleteMe
./install.py
cd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/tern_runtime
npm install --production

# YouCompleteMe Installation for neovim
cd ~/.config/nvim/plugged/YouCompleteMe
./install.py
cd ~/.config/nvim/plugged/YouCompleteMe/third_party/ycmd/third_party/tern_runtime
npm install --production

# Enable emacs to start as a daemon by adding it to the launchagents
# You can manually run this with:
# sudo launchctl load -w /Library/LaunchAgents/gnu.emacs.daemon.plist
sudo cp gnu.emacs.daemon.plist /Library/LaunchAgents/

# Enable docker to start as a daemon by adding it to the launchagents
# You can manually run this with:
# sudo launchctl load -w /Library/LaunchAgents/com.docker.machine.default.plist
sudo cp com.docker.machine.default.plist /Library/LaunchAgents/

# Disable the spacing around iterm when you try to do a full-screen with spectacle
defaults write com.googlecode.iterm2 DisableWindowSizeSnap -integer 1

# Disable the console 'Last Login' message
touch ~/.hushlogin
