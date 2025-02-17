#!/bin/bash

# 🏠 Home sweet home
cd ~ 

# Prompt user for email and GitHub username
read -p "Enter your email address: " user_email
read -p "Enter your GitHub username: " github_user

# Install Xcode Command Line Tools & Homebrew
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Refresh shell to apply changes
exec "$SHELL"

# Install utilities & shell tools
brew install tree fzf ack bash-completion ncdu

# Install Oh My Zsh 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Miniconda
brew install --cask miniconda

# Initialize Conda
echo "Initializing Conda..."
source "$HOME/miniconda3/etc/profile.d/conda.sh"
conda init

# Configure zshrc
echo "🛠 Configuring zshrc"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
echo "source ${(q-)PWD}/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions
echo "source ${(q-)PWD}/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

echo 'alias zshconfig="code ~/.zshrc"' >> ${ZDOTDIR:-$HOME}/.zshrc
echo "alias gs='git status -sb'" >> ${ZDOTDIR:-$HOME}/.zshrc
echo 'alias freeport="f() { lsof -ti :$1 | xargs kill -9; }; f"' >> ${ZDOTDIR:-$HOME}/.zshrc
echo 'eval "$(fnm env --use-on-cd)"' >> ${ZDOTDIR:-$HOME}/.zshrc

# Add Conda initialization to .zshrc
echo 'source "$HOME/miniconda3/etc/profile.d/conda.sh"' >> ${ZDOTDIR:-$HOME}/.zshrc
echo 'conda init' >> ${ZDOTDIR:-$HOME}/.zshrc

echo -e "\033[32m✅ zsh configuration completed"

reset

# Install iTerm2
brew install --cask iterm2

# Install development tools
curl -fsSL https://fnm.vercel.app/install | bash

# Load fnm immediately into the shell
export PATH="$HOME/.fnm:$PATH"
eval "$(fnm env)"

# Install latest Node.js & set as default
fnm install --latest
fnm use --latest
fnm default $(fnm current)

# Install essential apps
brew install --cask rectangle visual-studio-code notion figma postman spotify google-chrome

# Install Docker
brew install --cask docker

# Install VS Code extensions
extensions=(
  sourcegraph.cody-ai
  eamodio.gitlens
  esbenp.prettier-vscode
  CoenraadS.bracket-pair-colorizer
  # Install VS Code themes
  alexanderte.dainty-vscode
  dracula-theme.theme-dracula
)

for ext in "${extensions[@]}"; do
  code --install-extension "$ext"
done

# Prompt user for GitHub SSH setup
read -p "Do you want to set up GitHub SSH keys? (y/n): " setup_ssh
if [[ $setup_ssh =~ ^[Yy]$ ]]; then
  ssh-keygen -t ed25519 -C "$user_email"
  eval "$(ssh-agent -s)"
  pbcopy < ~/.ssh/id_ed25519.pub
  echo "SSH key copied to clipboard. Add it to your GitHub account at https://github.com/settings/keys"
  git config --global user.name "$github_user"
  git config --global user.email "$user_email"
fi

# Final message
echo "✅ Setup complete! Restart your terminal for all changes to take effect."