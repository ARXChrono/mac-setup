#!/bin/bash

# 🏠 Home sweet home
cd ~ 

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Install Xcode Command Line Tools if not installed
if ! xcode-select -p &>/dev/null; then
  echo "Installing Xcode Command Line Tools..."
  xcode-select --install
else
  echo "Xcode Command Line Tools already installed."
fi

# Install Homebrew if not installed
if ! command_exists brew; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew already installed."
fi

# Refresh shell to apply changes
source ~/.bash_profile

# Install utilities & shell tools if not installed
for tool in tree fzf ack bash-completion ncdu; do
  if ! command_exists $tool; then
    echo "Installing $tool..."
    brew install $tool
  else
    echo "$tool already installed."
  fi
done

# Install Oh My Zsh if not installed
if [ ! -d ~/.oh-my-zsh ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh already installed."
fi

# Install Miniconda if not installed
if [ ! -d ~/miniconda3 ]; then
  echo "Installing Miniconda..."
  brew install --cask miniconda
  # Initialize Conda
  echo "Initializing Conda..."
  source "$HOME/miniconda3/etc/profile.d/conda.sh"
  conda init
else
  echo "Miniconda already installed."
fi

# Install fnm if not installed
if ! command_exists fnm; then
  echo "Installing fnm..."
  curl -fsSL https://fnm.vercel.app/install | bash
else
  echo "fnm already installed."
fi

# Configure zshrc
echo "🛠 Configuring zshrc"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
echo "source ${(q-)PWD}/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions
echo "source ${(q-)PWD}/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

echo 'alias zshc="code ~/.zshrc"' >> ${ZDOTDIR:-$HOME}/.zshrc
echo 'alias reload="source ~/.zshrc"' >> ${ZDOTDIR:-$HOME}/.zshrc

echo "alias gs='git status -sb'" >> ${ZDOTDIR:-$HOME}/.zshrc
echo 'alias cl="clear"' >> ${ZDOTDIR:-$HOME}/.zshrc
echo 'alias netinfo="echo \"IP Addresses:\" && ifconfig | awk \047/inet / && !/127.0.0.1/ {print \$2}\047 && echo \"Default Gateway:\" && route -n get default | awk \047/gateway/ {print \$2}\047"' >> ${ZDOTDIR:-$HOME}/.zshrc
echo 'alias ports="netstat -anp tcp | grep LISTEN"' >> ${ZDOTDIR:-$HOME}/.zshrc
echo 'alias freeport="f() { lsof -ti :$1 | xargs kill -9; }; f"' >> ${ZDOTDIR:-$HOME}/.zshrc

# Add fnm initialization to.zshrc
echo 'eval "$(fnm env --use-on-cd)"' >> ${ZDOTDIR:-$HOME}/.zshrc

# Create an empty directory called 'projects' and add an alias to navigate to it
if [ ! -d ~/projects ]; then
  echo "Creating 'projects' directory..."
  mkdir ~/projects
fi
echo 'alias pj="cd ~/projects"' >> ${ZDOTDIR:-$HOME}/.zshrc

# Add Conda initialization to .zshrc
echo 'source "$HOME/miniconda3/etc/profile.d/conda.sh"' >> ${ZDOTDIR:-$HOME}/.zshrc
echo 'conda init' >> ${ZDOTDIR:-$HOME}/.zshrc

echo -e "\033[32m✅ zsh configuration completed"

# Source the updated .zshrc to apply changes
source ${ZDOTDIR:-$HOME}/.zshrc

# Install iTerm2 if not installed
if ! command_exists iterm2; then
  echo "Installing iTerm2..."
  brew install --cask iterm2
else
  echo "iTerm2 already installed."
fi

# Install development tools if not installed
for tool in rectangle visual-studio-code notion figma postman spotify google-chrome maccy; do
  if ! brew list --cask $tool &>/dev/null; then
    echo "Installing $tool..."
    brew install --cask $tool
  else
    echo "$tool already installed."
  fi
done

# Install Docker if not installed
if ! command_exists docker; then
  echo "Installing Docker..."
  brew install --cask docker
else
  echo "Docker already installed."
fi

# Install VS Code extensions
extensions=(
  sourcegraph.cody-ai
  eamodio.gitlens
  esbenp.prettier-vscode
  CoenraadS.bracket-pair-colorizer
  alexanderte.dainty-vscode
  dracula-theme.theme-dracula
)

for ext in "${extensions[@]}"; do
  if ! code --list-extensions | grep -q "$ext"; then
    echo "Installing VS Code extension: $ext"
    code --install-extension "$ext"
  else
    echo "VS Code extension $ext already installed."
  fi
done

# Prompt user for GitHub SSH setup
echo "Would you like to set up GitHub SSH keys? (y/n)"
read -p "" setup_ssh
if [[ $setup_ssh =~ ^[Yy]$ ]]; then
  read -p "Enter your email address: " user_email
  read -p "Enter your GitHub username: " github_user
  if [ ! -f ~/.ssh/id_ed25519 ]; then
    ssh-keygen -t ed25519 -C "$user_email"
    eval "$(ssh-agent -s)"
    pbcopy < ~/.ssh/id_ed25519.pub
    echo "SSH key copied to clipboard. Add it to your GitHub account at https://github.com/settings/keys"
  else
    echo "SSH key already exists."
  fi
  git config --global user.name "$github_user"
  git config --global user.email "$user_email"
fi

# Final message
echo "✅ Setup complete! Restart your terminal for all changes to take effect."