#!/bin/bash

sudo apt-get update && sudo apt-get install zsh curl git terminator apt-transport-https build-essential
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install sublime-text code
echo 'alias update-all="sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt autoremove -y"' >> ~/.zshrc
source ~/.zshrc
update-all
mkdir ~/tools
cd ~/tools
git clone https://github.com/EmpireProject/Empire.git
git clone https://github.com/BloodHoundAD/BloodHound.git
git clone https://github.com/PowerShellMafia/PowerSploit.git
git clone https://github.com/noahpowers/ServerSetup.git
git clone https://github.com/noahpowers/nlzr.git
git clone https://github.com/Veil-Framework/Veil-Evasion.git
git clone https://github.com/Veil-Framework/Veil-Pillage.git
git clone https://github.com/HarmJ0y/Malleable-C2-Profiles.git
git clone https://github.com/GhostPack/Seatbelt.git
git clone https://github.com/xan7r/kerberoast.git
git clone https://github.com/gentilkiwi/mimikatz.git
git clone https://github.com/rasta-mouse/TikiTorch.git
git clone https://github.com/byt3bl33d3r/CrackMapExec.git
git clone https://github.com/SpiderLabs/Responder.git
