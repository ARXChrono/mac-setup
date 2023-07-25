#!/bin/bash

# 🏠 Home sweet home
cd ~ 

# Install xcode & brew
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
reset

# Console & zsh & iterm config
brew install tree
brew install fzf
brew install ack
brew install bash-completion
brew install ncdu
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
bash <(curl -s https://raw.githubusercontent.com/ARXChrono/mac-setup/master/configs/zsh.sh) 
brew install --cask iterm2
brew tap homebrew/cask-fonts && brew install --cask font-source-code-pro && brew install --cask font-ibm-plex 

# Dev 
brew install git
brew install node
curl -fsSL https://fnm.vercel.app/install | bash

# Install Apps
brew install --cask rectangle
brew install --cask visual-studio-code
brew install --cask slack 
brew install --cask notion
brew install --cask figma
brew install --cask ngrok
brew install --cask postman
brew install --cask spotify
brew install --cask google-chrome

## Theme
code --install-extension alexanderte.dainty-vscode
code --install-extension dracula-theme.theme-dracula
code --install-extension pkief.material-icon-theme

## Extensions
code --install-extension github.copilot
code --install-extension eamodio.gitlens
code --install-extension esbenp.prettier-vscode
code --install-extension dbaeumer.vscode-eslint
code --install-extension mgmcdermott.vscode-language-babel
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension aliariff.auto-add-brackets
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension wix.vscode-import-cost
code --install-extension shyykoserhiy.vscode-spotify

# TODO: find automation for github ssh setup, will have to do below manually for now.
# ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
# eval "$(ssh-agent -s)"
# pbcopy < ~/.ssh/id_rsa.pub
# git config --global user.name "ARXChrono" 
# git config --global user.email "email@example.com"
