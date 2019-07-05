#!/bin/bash

echo -e "\033[1;31m Configuring Shaun's Mac Setup 🚚"

# TODO: Mac configurations - touchpad, keybord, dock etc.

# install xcode & homebrew
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# console & zsh

brew install tree
brew install fzf
brew install ack
brew install bash-completion
curl -Lo install.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
sh install.sh --unattended
ZSH="$HOME/.dotfiles/oh-my-zsh" sh install.sh
brew cask install iterm2

# TODO: configure/import zsh settings, theme, alias etc

# dev stuff

brew install git
brew install hub
brew install node
brew install gist
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
brew install yarn --ignore-dependencies
yarn config set workspaces-experimental true


# Install Apps
brew cask install iterm2
brew cask install istat-menus
brew cask install statusfy
brew cask install karabiner-elements
brew cask install spectacle
brew cask install visual-studio-code
brew cask install google-chrome
brew cask install slack 
brew cask install spotify
brew cask install notion

# TODO: vscode plugins, themes, and import config

# TO DO 
# find automation for github ssh setup, will have to do below manually for now.
# ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
# eval "$(ssh-agent -s)"
# pbcopy < ~/.ssh/id_rsa.pub


echo "Done ✨"
