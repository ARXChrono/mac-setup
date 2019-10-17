#!/bin/bash

# 🏠 Home sweet home
cd ~ 

# Install xcode
echo "✅ Installing xcode and homebrew"
xcode-select --install
# Install or update homebrew
which -s brew
if [[ $? != 0 ]] ; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi

# Console & zsh & iterm config
echo "✅ Installing utils tree, fzf, bash completion"
brew install tree
brew install fzf
brew install ack
brew install bash-completion
brew install ncdu

echo "✅ Installing zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
bash <(curl -s https://raw.githubusercontent.com/ARXChrono/mac-setup/master/configs/zsh.sh) 

echo "✅ Installing iterm2"
brew cask install iterm2
# configure iterm fonts, will need to open iterm2 and add my custom colors for now.
brew tap caskroom/fonts && brew cask install font-source-code-pro && brew cask install font-ibm-plex 

# Dev 
echo "✅ Installing git, hub, node, nvm, gist, yarn"
brew install git
brew install hub
brew install node
brew install gist
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
brew install yarn --ignore-dependencies
yarn config set workspaces-experimental true

# Install Apps
echo "✅ Installing apps"
brew cask install karabiner-elements
brew cask install spectacle
brew cask install angry-ip-scanner
brew cask install sourcetree
brew cask install visual-studio-code
brew cask install slack 
brew cask install notion
brew cask install clipy
brew cask install figma
brew cask install ngrok
brew cask install postman
brew tap devhubapp/devhub
brew cask install devhub

# actually this one doesn't work yet - manually add this.
# brew cask install tweetdeck 

# Media 
brew cask install spotify
brew cask install spotmenu
brew cask install vlc
brew cask install handbrake

# Browsers
brew cask install firefox
brew cask install google-chrome

# VSCode todo: export config

## Theme
echo "✅ Installing vscode themes and plugins"
code --install-extension monokai.theme-monokai-pro-vscode
code --install-extension alexanderte.dainty-vscode
code --install-extension dracula-theme.theme-dracula
code --install-extension pkief.material-icon-theme

## Extensions
code --install-extension alefragnani.project-manager
code --install-extension aliariff.auto-add-brackets
code --install-extension apollographql.vscode-apollo
code --install-extension burkeholland.react-food-truck
code --install-extension burkeholland.simple-react-snippets
code --install-extension capaj.vscode-exports-autocomplete
code --install-extension christian-kohler.npm-intellisense
code --install-extension christian-kohler.path-intellisense
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension dbaeumer.vscode-eslint
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension eamodio.gitlens
code --install-extension eg2.vscode-npm-script
code --install-extension eriklynd.json-tools
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension jpoissonnier.vscode-styled-components
code --install-extension kumar-harsh.graphql-for-vscode
code --install-extension mgmcdermott.vscode-language-babel
code --install-extension Prisma.vscode-graphql
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension wix.vscode-import-cost
code --install-extension lunarlimbo.banner-comments-plus

# TODO: find automation for github ssh setup, will have to do below manually for now.
# ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
# eval "$(ssh-agent -s)"
# pbcopy < ~/.ssh/id_rsa.pub
# git config --global user.name "ARXChrono" 
# git config --global user.email "email@example.com"
