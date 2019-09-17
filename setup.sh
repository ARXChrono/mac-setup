#!/bin/bash

# Import Scripts
echo -e "\033[32mBegin Shaun's Mac Setup 🚚"
echo "The following Changes will require admin privileges"

bash <(curl -s https://raw.githubusercontent.com/ARXChrono/mac-setup/master/scripts/macConfig.sh)
bash <(curl -s https://raw.githubusercontent.com/ARXChrono/mac-setup/master/scripts/install.sh)

echo -e "\033[32mShaun's Mac Setup Done ✨"
echo "🗒 Note that some of these changes require a logout/restart to take effect."


