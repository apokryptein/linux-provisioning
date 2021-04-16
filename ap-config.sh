#!/bin/bash

sudo apt-get update && sudo apt-get install zsh curl git terminator apt-transport-https build-essential

DIR="/home/$(whoami)/"
echo "[i] Checking for $DIR"
if [ ! -d "$DIR/.config/terminator" ]; then
    echo "[!] $DIR.config/terminator does not exist.  Creating directory..."
    mkdir ~/.config/terminator
fi

echo "[i] Checking if Terminator config already exists"
sleep 2
if [ ! -f "$DIR/.config/terminator/config" ]; then
    echo "[!] Config file does not exist.  Creating config file..."
    sleep 2
    echo "[global_config]" >> ~/.config/terminator/config
    echo "  title_transmit_bg_color = \"#22354b\"" >> ~/.config/terminator/config
    echo "[keybindings]" >> ~/.config/terminator/config
    echo "[profiles]" >> ~/.config/terminator/config
    echo "  [[default]]" >> ~/.config/terminator/config
    echo "    cursor_color = \"#aaaaaa\"" >> ~/.config/terminator/config
    echo "[layouts]" >> ~/.config/terminator/config
    echo "  [[default]]" >> ~/.config/terminator/config
    echo "    [[[window0]]]" >> ~/.config/terminator/config
    echo "      type = Window" >> ~/.config/terminator/config
    echo "      parent = \"\"" >> ~/.config/terminator/config
    echo "      profile = None" >> ~/.config/terminator/config
    echo "      size = 1000, 450" >> ~/.config/terminator/config
    echo "    [[[child1]]]" >> ~/.config/terminator/config
    echo "      type = Terminal" >> ~/.config/terminator/config
    echo "      parent = window0" >> ~/.config/terminator/config
    echo "[plugins]" >> ~/.config/terminator/config
fi 

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt-get update
sudo apt-get install sublime-text code

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
git clone https://github.com/GhostPack/SharpUp
git clone https://github.com/xan7r/kerberoast.git
git clone https://github.com/gentilkiwi/mimikatz.git
git clone https://github.com/rasta-mouse/TikiTorch.git
git clone https://github.com/byt3bl33d3r/CrackMapExec.git
git clone https://github.com/SpiderLabs/Responder.git
git clone https://github.com/jasonjfrank/gnmap-parser.git
git clone https://github.com/mdsecactivebreach/SharpShooter.git
git clone https://github.com/FortyNorthSecurity/EXCELntDonut.git
git clone https://github.com/optiv/ScareCrow.git

echo "[i] Checking for $DIR/shares"
if [ ! -d "$DIR/shares" ]; then
    echo "[!] $DIR/shares does not exist.  Creating directory..."
    mkdir ~/shares
fi

echo "[i] Mounting shares"
/usr/bin/vmhgfs-fuse .host:/ /home/$(whoami)/shares -o subtype=vmhgfs-fuse,allow_other

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo 'alias update-all="sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt autoremove -y"' >> ~/.zshrc
echo 'alias mount-shares="/usr/bin/vmhgfs-fuse .host:/ ~/shares -o subtype=vmhgfs-fuse,allow_other"' >> ~/.zshrc
echo 'export PATH=$PATH:/usr/sbin' >> ~/.zshrc
source ~/.zshrc
update-all
