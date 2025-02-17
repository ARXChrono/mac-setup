#!/bin/bash

# URL of the color theme file
COLOR_THEME_URL="https://raw.githubusercontent.com/ARXChrono/mac-setup/refs/heads/master/configs/shauns.itermcolors"
COLOR_THEME_FILE="shauns.itermcolors"

# Download the color theme file
echo "Downloading color theme from $COLOR_THEME_URL..."
curl -fsSL "$COLOR_THEME_URL" -o "$COLOR_THEME_FILE"

# Check if the download was successful
if [ ! -f "$COLOR_THEME_FILE" ]; then
  echo "Failed to download the color theme file."
  exit 1
fi

# Apply the color theme to iTerm2
echo "Applying color theme to iTerm2..."
open "$COLOR_THEME_FILE"

# Restart iTerm2 to apply the changes
echo "Restarting iTerm2 to apply the changes..."
osascript -e 'quit app "iTerm"'
open -a iTerm

echo "Color theme applied successfully."