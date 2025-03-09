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

# Refresh shell to apply changes if bash_profile exists
if [ -f ~/.bash_profile ]; then
    source ~/.bash_profile
fi

# Install CLI development tools
for tool in tree fzf ack bash-completion ncdu; do
  if ! command_exists $tool; then
    echo "Installing $tool..."
    brew install $tool
  else
    echo "$tool already installed."
  fi
done

# Install GUI applications
for app in iterm2 rectangle visual-studio-code notion figma postman spotify google-chrome maccy; do
  if ! brew list --cask $app &>/dev/null; then
    echo "Installing $app..."
    brew install --cask $app
  else
    echo "$app already installed."
  fi
done

# Install development tools
for devtool in docker; do
  if ! brew list --cask $devtool &>/dev/null; then
    echo "Installing $devtool..."
    brew install --cask $devtool
  else
    echo "$devtool already installed."
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

# Backup existing zshrc
if [ -f "${ZDOTDIR:-$HOME}/.zshrc" ]; then
    echo "Creating backup of existing .zshrc..."
    cp "${ZDOTDIR:-$HOME}/.zshrc" "${ZDOTDIR:-$HOME}/.zshrc.backup"
fi

# Define installation directories
ZSH_DIR="$HOME/.zsh"
SYNTAX_HIGHLIGHTING_DIR="$ZSH_DIR/zsh-syntax-highlighting"
AUTOSUGGESTIONS_DIR="$ZSH_DIR/zsh-autosuggestions"

# Ensure Homebrew is in PATH
if [[ ":$PATH:" != *":/opt/homebrew/bin:"* ]]; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ${ZDOTDIR:-$HOME}/.zshrc
fi

# Clone zsh-syntax-highlighting if it doesn't exist
if [ ! -d "$SYNTAX_HIGHLIGHTING_DIR" ]; then
    echo "Cloning zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$SYNTAX_HIGHLIGHTING_DIR"
    if [ $? -ne 0 ]; then
        echo "Failed to clone zsh-syntax-highlighting. Exiting."
        exit 1
    fi
    echo "source $SYNTAX_HIGHLIGHTING_DIR/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
else
    echo "zsh-syntax-highlighting already exists. Skipping clone."
fi

# Clone zsh-autosuggestions if it doesn't exist
if [ ! -d "$AUTOSUGGESTIONS_DIR" ]; then
    echo "Cloning zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$AUTOSUGGESTIONS_DIR"
    if [ $? -ne 0 ]; then
        echo "Failed to clone zsh-autosuggestions. Exiting."
        exit 1
    fi
    echo "source $AUTOSUGGESTIONS_DIR/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
else
    echo "zsh-autosuggestions already exists. Skipping clone."
fi

# Add zshrc configurations
echo 'Adding zsh configurations...'

# Editor and reload aliases
echo 'alias zshc="code ~/.zshrc"' >> ${ZDOTDIR:-$HOME}/.zshrc
echo 'alias reload="source ~/.zshrc"' >> ${ZDOTDIR:-$HOME}/.zshrc

# Git aliases
echo "alias gs='git status -sb'" >> ${ZDOTDIR:-$HOME}/.zshrc

# System utilities
echo 'alias cl="clear"' >> ${ZDOTDIR:-$HOME}/.zshrc
echo 'alias pj="cd ~/projects"' >> ${ZDOTDIR:-$HOME}/.zshrc

# Network utilities
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
if command_exists code; then
    extensions=(
      sourcegraph.cody-ai
      esbenp.prettier-vscode
      bradlc.vscode-tailwindcss
      oderwat.indent-rainbow
      bierner.color-info
      atomiks.moonlight
      dracula-theme.theme-dracula
    )

    for ext in "${extensions[@]}"; do
      if ! code --list-extensions | grep -q "$ext"; then
        echo "Installing VS Code extension: $ext"
        if ! code --install-extension "$ext"; then
          echo "⚠️  Failed to install extension: $ext"
        fi
      else
        echo "VS Code extension $ext already installed."
      fi
    done
else
    echo "⚠️  VS Code not found in PATH. Skipping extension installation."
fi

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
