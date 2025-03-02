#!/bin/bash

echo "Downloading iTerm2 color schemes..."

# Create hidden themes directory if it doesn't exist
THEMES_DIR="$HOME/.iterm-themes"
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

echo "✅ Color schemes downloaded to $THEMES_DIR"
echo "To apply the themes:"
echo "1. Open iTerm2 Preferences (⌘,)"
echo "2. Go to Profiles > Colors"
echo "3. Click on 'Color Presets...' > Import"
echo "4. Select the .itermcolors files from $THEMES_DIR"