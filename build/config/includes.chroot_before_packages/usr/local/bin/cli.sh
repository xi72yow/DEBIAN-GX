#!/bin/sh

confirm() {
    gum confirm "$2" && ($1) || echo "not confirmed"
}

nvm_install_dir() {
    if [ -n "$NVM_DIR" ]; then
        printf %s "${NVM_DIR}"
    else
        nvm_default_install_dir
    fi
}

install_nvm() {
    if [ -z "$NVM_DIR" ]; then
        sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
        export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        nvm install --lts
    else
        echo "nvm dir: $NVM_DIR is already set"
    fi
}

install_newest_backport_kernel() {
    sudo apt install -t bullseye-backports linux-image-amd64
    sudo apt install -t bullseye-backports firmware-linux firmware-linux-nonfree firmware-misc-nonfree
    sudo apt install linux-headers-$(uname -r) #dkms
    #remove old kernel
    # sudo apt-get remove $(dpkg -l|egrep '^ii  linux-(im|he)'|awk '{print $2}'|grep -v `uname -r`) && sudo apt autoremove
}

install_github_cli() {
    type -p curl >/dev/null || sudo apt install curl -y
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg &&
        sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg &&
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null &&
        sudo apt update &&
        sudo apt install gh -y
}

menue() {
    gum style \
        --foreground 212 --border-foreground 212 --border double \
        --align center --width 50 --margin "1 2" --padding "2 4" \
        'DEB-GX' 'the fine tuning'

    TYPE=$(gum choose "install nvm" "new Kernel" "exit" "install GitHub cli")

    case "$TYPE" in
    "install nvm")
        confirm install_nvm "Would you install nvm?"
        ;;
    "new Kernel")
        confirm install_newest_backport_kernel "Would you install new kernel?"
        ;;
    "install GitHub cli")
        confirm install_github_cli "Would you install GitHub CLI?"
        ;;
    "exit") exit ;;
    *) echo "interrupt" ;;
    esac
}

while [ true ]; do
    menue
done

#cat test.text | gum choose --no-limit
#gum input --placeholder "please enter your password" --password >password.text
#gum spin --spinner dot --title "Buying Bubble Gum..." -- sleep 5
#gum confirm "confirm?" && echo "confirmed" || echo "not confirmed"
