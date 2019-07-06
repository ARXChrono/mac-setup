#!/bin/bash

# Import Scripts
echo -e "\033[32mConfiguring Shaun's Mac Setup 🚚"

bash <(curl -s https://raw.githubusercontent.com/ARXChrono/mac-setup/master/scripts/macConfig.sh)
bash <(curl -s https://raw.githubusercontent.com/ARXChrono/mac-setup/master/scripts/install.sh)

echo -e "\033[32mShaun's Mac Setup Done ✨"