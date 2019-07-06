#!/bin/bash

# Import Scripts
echo -e "\033[1;31m Configuring Shaun's Mac Setup 🚚"

bash <(curl -s https://raw.githubusercontent.com/ARXChrono/mac-setup/master/scripts/macConfig.sh)
bash <(curl -s https://raw.githubusercontent.com/ARXChrono/mac-setup/master/scripts/install.sh)

echo -e "\033[32m Done ✨"