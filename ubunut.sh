#!/bin/bash
clear

printmsg() {
    echo "\e[31;1m$1\e[0m"
}

confirm() {
    read -r -p "$(printmsg "$1 [Y/n]") " input
    case $input in
    [yY][eE][sS] | [yY] | '')
        return 1
        ;;
    [nN][oO] | [nN])
        return 0
        ;;
    *)
        return 0
        ;;
    esac
}

# Install system updates
confirm 'Install system updates?'
if [ "$?" -eq "1" ]; then
    printmsg 'Installing system updates...'

    sudo apt update
    sudo apt upgrade -y
    sudo apt autoremove -y

    printmsg 'Done.'
fi

# System tools
confirm 'Install system tools?'
if [ "$?" -eq "1" ]; then
    printmsg 'Installing Git and VIM...'

    sudo apt update
    sudo apt install git vim -y

    printmsg 'Done.'
fi

# Fonts
confirm 'Install fonts?'
if [ "$?" -eq "1" ]; then
    printmsg 'Installing fonts...'

    sudo apt update
    sudo apt install ubuntu-restricted-extras fonts-roboto fonts-firacode -y

    printmsg 'Done.'
fi

# Gnome tools
confirm 'Install Gnome tools?'
if [ "$?" -eq "1" ]; then
    printmsg 'Installing Gnome tweak tool and Adwita theme...'

    sudo apt update
    sudo apt install gnome-tweak-tool adwaita-icon-theme-full -y

    printmsg 'Done.'
fi

# Zorin themes
confirm 'Install Zorin themes?'
if [ "$?" -eq "1" ]; then
    printmsg 'Installing Zorin themes...'

    git clone https://github.com/ZorinOS/zorin-desktop-themes.git
    git clone https://github.com/ZorinOS/zorin-icon-themes.git

    sudo cp -r zorin-desktop-themes/Z* /usr/share/themes
    sudo cp -r zorin-icon-themes/Z* /usr/share/icons

    printmsg 'Done.'
fi

# MX Master Mouse
confirm 'Install MX Master tools?'
if [ "$?" -eq "1" ]; then
    printmsg "Installing MX Master tools..."

    sudo apt update
    sudo apt install xbindkeys xautomation -y

    printmsg "Creating configuration file..."
    echo "
# thumb wheel up => increase volume
\"xte 'key XF86AudioRaiseVolume'\"
   b:6

# thumb wheel down => lower volume
\"xte 'key XF86AudioLowerVolume'\"
   b:7
" >~/.xbindkeysrc

    printmsg 'Done.'
fi

# Android phone connector
confirm 'Install scrcpy (Android phone)?'
if [ "$?" -eq "1" ]; then
    printmsg "Installing scrcpy..."

    sudo snap install scrcpy

    printmsg 'Done.'
fi

# Powerline
confirm 'Install Powerline Go?'
if [ "$?" -eq "1" ]; then
    printmsg "Installing Powerline..."

    sudo apt update
    sudo apt install golang-go
    go get -u github.com/justjanne/powerline-go

    printmsg "Adding Powerline to bashrc..."
    echo '
# >>> Powerline-Go >>>
GOPATH=$HOME/go
function _update_ps1() {
    PS1="$($GOPATH/bin/powerline-go -error $?)"
}

if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
# <<< Powerline-Go <<<
' >>~/.bashrc
    printmsg 'Done.'
fi

printmsg "\nGnome Extensions"
echo "- https://extensions.gnome.org/extension/517/caffeine/"
echo "- https://extensions.gnome.org/extension/1160/dash-to-panel/"
echo "- https://extensions.gnome.org/extension/19/user-themes/"

printmsg "\nWine"
echo "- https://wiki.winehq.org/Ubuntu"

printmsg "\nGoogle Chrome"
echo "- https://www.google.com/chrome/thank-you.html?statcb=0&installdataindex=empty&defaultbrowser=0"

printmsg "\n.NET SDK"
echo "- https://docs.microsoft.com/en-us/dotnet/core/install/linux-package-manager-ubuntu-1904"

printmsg "\nVS Code"
echo "- https://code.visualstudio.com/docs/?dv=linux64_deb"

printmsg "\nAnaconda"
echo "- https://www.anaconda.com/distribution/#download-section"

printmsg "\nLutris"
echo "- https://lutris.net/downloads/"

echo ""
