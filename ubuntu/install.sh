#!/bin/bash

# ensure the script is executable "chmod +x install.sh"

# update apt and install essentials
sudo apt update
sudo apt install curl unzip git ffmpeg
sudo apt install build-essential

# Installing Terminator, Zsh and Oh-My-Zsh
sudo apt install terminator zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install to fix powerlevel fonts
mkdir -p  downloads/fonts
curl -fsSL https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf --output ./downloads/fonts/MesloLGS%20NF%20Regular.ttf
curl -fsSL https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf --output ./downloads/fonts/MesloLGS%20NF%20Bold.ttf
curl -fsSL https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf --output ./downloads/fonts/MesloLGS%20NF%20Italic.ttf
curl -fsSL https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf --output ./downloads/fonts/MesloLGS%20NF%20Bold%20Italic.ttf

# installing vscode
sudo apt install software-properties-common apt-transport-https wget -y
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code
xargs -n 1 code --install-extension < ./configs/vscode/extensions.list

# installing go
sudo curl -fsSL  https://go.dev/dl/go1.23.3.linux-amd64.tar.gz --output ./downloads/go1.23.3.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf ./downloads/go1.23.3.linux-amd64.tar.gz

# TODO: remove relative path, get current file directory, navigate to configs
cp -f ./configs/.zshrc ~/.zshrc

# installing docker and docker-compose
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER

# Manual work
echo  "\033[0;32m Fixing powerlevel10k theme font"
echo "\033[0m Install all 4 fonts in the download/fonts folder."
echo  "\033[0;32m Create new ssh keys for github, etc"
echo "\033[0m ssh-keygen -t ed25519 -C 'your_email@example.com'"
