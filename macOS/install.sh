#!/bin/bash

# ensure the script is executable "chmod +x install.sh"
# ensure brew i

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# [$? -ne 0]; then
	echo "Homebrew installation failed. Exiting."
	exit 1
fi

# Install ITerm2
brew install --cask iterm2

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Download theme
mkdir downloads
curl https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/CyberpunkScarletProtocol.itermcolors -- output ./downloads/CyberpunkScarletProtocol.itermcolors

# Install ZSH Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install go
brew install go

# Install gvm
bash < <(curl -sSL https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

# Replace the newly generated .zshrc and use it
# TODO: remove relative path, get current file directory, navigate to configs
cp -f ./configs/.zshrc ~/.zshrc
source ~/.zshrc

# Install MySQL
brew install mysql

# Download sequel pro
curl -fsSL https://github.com/sequelpro/sequelpro/releases/download/release-1.1.2/sequel-pro-1.1.2.dmg --output ./downloads

# Install vscode
brew install --cask visual-studio-code

# Installing docker colima kubectl
brew install docker
brew install docker-compose
brew install colima
brew install kubectl

# Install Postman
brew install --cask postman

# Manual work
echo "\033[0;32m Importing theme into iTerm2"
echo "\033[0m Manually import CyberpunkScarletProtocol.itermcolors theme into iTerm2"
echo  "\033[0;32m Install SequelPro"
echo "\033[0m Check if sequal pro version is latest, install it in the downloads folder"
echo  "\033[0;32m Setting up VSCode and installing all extensions"
echo "\033[0m set shell command: 'install ... then run\nxargs -n 1 code --install-extension < ./configs/vscode/extensions.list"
echo  "\033[0;32m Create new ssh keys for github, etc"
echo "\033[0m ssh-keygen -t ed25519 -C 'your_email@example.com'"
