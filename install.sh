#!/bin/bash

echo -e "\033[1;31m Configuring Shaun's Mac Setup 🚚"

# TODO: Mac configurations - touchpad, keybord, dock etc.

# Install xcode & homebrew
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Console & zsh

brew install tree
brew install fzf
brew install ack
brew install bash-completion
curl -Lo install.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
sh install.sh --unattended
ZSH="$HOME/.dotfiles/oh-my-zsh" sh install.sh
brew cask install iterm2

# TODO: configure/import zsh settings, theme, alias etc

# Dev stuff

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

# VSCode - Theme, Extensions, todo: export config

code --install-extension monokai.theme-monokai-pro-vscode
code --install-extension pkief.material-icon-theme
code --install-extension mgmcdermott.vscode-language-babel
code --install-extension apollographql.vscode-apollo
code --install-extension Prisma.vscode-graphql
code --install-extension kumar-harsh.graphql-for-vscode
code --install-extension burkeholland.react-food-truck
code --install-extension burkeholland.simple-react-snippets
code --install-extension capaj.vscode-exports-autocomplete
code --install-extension christian-kohler.npm-intellisense
code --install-extension christian-kohler.path-intellisense
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension dbaeumer.vscode-eslint
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension eamodio.gitlens
code --install-extension dzannotti.vscode-babel-coloring
code --install-extension eg2.vscode-npm-script
code --install-extension eriklynd.json-tools
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension jpoissonnier.vscode-styled-components
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension wix.vscode-import-cost

# TODO: find automation for github ssh setup, will have to do below manually for now.
# ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
# eval "$(ssh-agent -s)"
# pbcopy < ~/.ssh/id_rsa.pub
# git config --global user.name "ARXChrono" 
# git config --global user.email "email@example.com"

echo -e "\033[32m Done ✨"