#!/bin/bash

# 🏠 Home sweet home
cd ~ 

# Install xcode
xcode-select --install

# Console & zsh & iterm config
brew install tree
brew install fzf
brew install ack
brew install bash-completion
brew install ncdu

echo "✅ Installing zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
bash <(curl -s https://raw.githubusercontent.com/ARXChrono/mac-setup/master/configs/zsh.sh) 

echo "✅ Installing iterm2"
brew install --cask iterm2
# configure iterm fonts, will need to open iterm2 and add my custom colors for now.
brew tap caskroom/fonts && brew install --cask font-source-code-pro && brew install --cask font-ibm-plex 

# Dev 
echo "✅ Installing git, hub, node, nvm, gist, yarn"
brew install git
brew install hub
brew install node
brew install gist
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash

# Install Apps
echo "✅ Installing apps"
brew install --cask rectangle
brew install --cask visual-studio-code
brew install --cask slack 
brew install --cask notion
brew install --cask figma
brew install --cask ngrok
brew install --cask postman
brew install --cask spotify
brew install --cask google-chrome

# VSCode todo: export config

## Theme
echo "✅ Installing vscode themes and plugins"
code --install-extension alexanderte.dainty-vscode
code --install-extension dracula-theme.theme-dracula
code --install-extension pkief.material-icon-theme

## Extensions
code --install-extension aliariff.auto-add-brackets
code --install-extension capaj.vscode-exports-autocomplete
code --install-extension christian-kohler.npm-intellisense
code --install-extension christian-kohler.path-intellisense
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension dbaeumer.vscode-eslint
code --install-extension eamodio.gitlens
code --install-extension eg2.vscode-npm-script
code --install-extension eriklynd.json-tools
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension mgmcdermott.vscode-language-babel
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension wix.vscode-import-cost
code --install-extension shyykoserhiy.vscode-spotify

# TODO: find automation for github ssh setup, will have to do below manually for now.
# ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
# eval "$(ssh-agent -s)"
# pbcopy < ~/.ssh/id_rsa.pub
# git config --global user.name "ARXChrono" 
# git config --global user.email "email@example.com"
