#!/bin/bash

echo "Downloading iTerm2 color schemes..."

# Create hidden themes directory if it doesn't exist
THEMES_DIR="$HOME/.iterm-themes"
rm -rf "$THEMES_DIR"
mkdir -p "$THEMES_DIR"

# Download custom Shaun's theme
SHAUNS_THEME_URL="https://raw.githubusercontent.com/ARXChrono/mac-setup/refs/heads/master/configs/shauns.itermcolors"
curl -fsSL "$SHAUNS_THEME_URL" -o "$THEMES_DIR/shauns.itermcolors"

# Download Dracula theme
DRACULA_THEME_URL="https://raw.githubusercontent.com/dracula/iterm/master/Dracula.itermcolors"
curl -fsSL "$DRACULA_THEME_URL" -o "$THEMES_DIR/Dracula.itermcolors"

# Download Catppuccin theme
CATPPUCCIN_THEME_URL="https://raw.githubusercontent.com/catppuccin/iterm/main/colors/catppuccin-mocha.itermcolors"
curl -fsSL "$CATPPUCCIN_THEME_URL" -o "$THEMES_DIR/Catppuccin-Mocha.itermcolors"

# Download Cyberpunk theme
CYBERPUNK_THEME_URL="https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/cyberpunk.itermcolors"
curl -fsSL "$CYBERPUNK_THEME_URL" -o "$THEMES_DIR/Cyberpunk.itermcolors"

# Download Embark theme
EMBARK_THEME_URL="https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Embark.itermcolors"
curl -fsSL "$EMBARK_THEME_URL" -o "$THEMES_DIR/Embark.itermcolors"

# Download Galaxy theme
GALAXY_THEME_URL="https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Galaxy.itermcolors"

curl -fsSL "$GALAXY_THEME_URL" -o "$THEMES_DIR/Galaxy.itermcolors"

# Clear existing custom presets
defaults delete com.googlecode.iterm2 "Custom Color Presets" 2>/dev/null || true

# Apply themes to iTerm2
defaults write com.googlecode.iterm2 "Custom Color Presets" -dict-add "Shauns" "$(cat "$THEMES_DIR/shauns.itermcolors")"
defaults write com.googlecode.iterm2 "Custom Color Presets" -dict-add "Dracula" "$(cat "$THEMES_DIR/Dracula.itermcolors")"
defaults write com.googlecode.iterm2 "Custom Color Presets" -dict-add "Catppuccin-Mocha" "$(cat "$THEMES_DIR/Catppuccin-Mocha.itermcolors")"
defaults write com.googlecode.iterm2 "Custom Color Presets" -dict-add "Cyberpunk" "$(cat "$THEMES_DIR/Cyberpunk.itermcolors")"
defaults write com.googlecode.iterm2 "Custom Color Presets" -dict-add "Embark" "$(cat "$THEMES_DIR/Embark.itermcolors")"
defaults write com.googlecode.iterm2 "Custom Color Presets" -dict-add "Galaxy" "$(cat "$THEMES_DIR/Galaxy.itermcolors")"

# Set Shaun's theme as default
defaults write com.googlecode.iterm2 "Default Bookmark Guid" -string "Shauns"

echo "✅ Color schemes downloaded and applied"
echo "The themes are now available in iTerm2 Preferences > Profiles > Colors > Color Presets"