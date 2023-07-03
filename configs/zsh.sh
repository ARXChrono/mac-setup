#!/bin/sh

echo "🛠 Configuring zshrc"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
echo "source ${(q-)PWD}/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "source ${(q-)PWD}/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

echo 'alias zshconfig="code ~/.zshrc"' >> ${ZDOTDIR:-$HOME}/.zshrc
echo "alias gs='git status -sb'" >> ${ZDOTDIR:-$HOME}/.zshrc

echo 'alias ys="yarn start"' >> ${ZDOTDIR:-$HOME}/.zshrc
echo 'alias yd="yarn dev"' >> ${ZDOTDIR:-$HOME}/.zshrc
echo 'alias yl="yarn lint"' >> ${ZDOTDIR:-$HOME}/.zshrc
echo 'alias yys="yarn && yarn start"' >> ${ZDOTDIR:-$HOME}/.zshrc
echo 'alias ycs="yarn clean && yarn start"' >> ${ZDOTDIR:-$HOME}/.zshrc
echo 'alias yb="yarn build"' >> ${ZDOTDIR:-$HOME}/.zshrc
echo 'alias ybs="yarn build && yarn serve"' >> ${ZDOTDIR:-$HOME}/.zshrc
echo 'alias yui="yarn upgrade-interactive --latest"' >> ${ZDOTDIR:-$HOME}/.zshrc

echo -e "\033[32m✅ zsh configured completed"

reset