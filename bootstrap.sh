#!/usr/bin/env zsh

BASE_PACKAGES=(zsh git git-extras neovim mc htop nmap arp-scan arpoison ettercap tcpflow spoof-mac tor proxychains-ng wget mtr wrk tree ag rg jq jid tmux reattach-to-user-namespace cmatrix figlet fzf ranger ncdu watch pwgen coreutils z m-cli httpie diff-so-fancy go grc bat prettyping fd tldr noti entr exa)
RANGER_PACKAGES=(highlight)
CASK_PACKAGES=(keycastr font-hack font-hack-nerd-font font-fira-code font-firacode-nerd-font)

BREW_PACKAGES=("${BASE_PACKAGES[@]}" "${RANGER_PACKAGES[@]}")

function tap_brew_cask_fonts() {
    brew tap | grep homebrew/cask-fonts > /dev/null || brew tap homebrew/cask-fonts
}

function install_brew_packages() {
    for index in $BREW_PACKAGES; do
        if command -v $index >/dev/null 2>&1; then
            echo "    > (Skipping) $index already installed."
        else
            echo "    > Installing $index..."
            brew install $index &> /dev/null
        fi
    done
}

function install_brew_cask_packages() {
    for index in $CASK_PACKAGES; do
        echo "    > Installing (cask) $index..."
        brew cask install $index &> /dev/null
    done
}


echo "     _       _    __ _ _"
echo "  __| | ___ | |_ / _(_) | ___  ___"
echo " / _\` |/ _ \| __| |_| | |/ _ \/ __|"
echo "| (_| | (_) | |_|  _| | |  __/\__ \\"
echo " \__,_|\___/ \__|_| |_|_|\___||___/"
echo ""

echo "==> Here we go..."

cd "$(dirname "$0")"

echo "  > Pulling latest dotfiles..."
git pull &> /dev/null

echo "  > Updating homebrew..."
brew update &> /dev/null

echo "  > Tap cask homebrew/cask-fonts..."
tap_brew_cask_fonts

echo "  > Installing homebrew packages..."
install_brew_packages

echo "  > Installing homebrew cask packages..."
install_brew_cask_packages

echo "  > Upgrading homebrew..."
brew upgrade &> /dev/null

echo "  > Upgrading homebrew cask..."
brew cask upgrade &> /dev/null

echo "  > Sync dotfiles..."
rsync --exclude ".git/" --exclude ".DS_Store" --exclude "Makefile" --exclude "bootstrap.sh" --exclude "README.rst" --exclude "screenshot-general.png" --exclude "screenshot-neovim.png" --exclude "screenshot-iterm2-fonts.png" --exclude "TODO" --exclude ".extra/vscode/" -av . ~ &> /dev/null

echo "  > Sync Visual Studio Code..."
rsync --exclude ".DS_Store" -av ./.extra/vscode/settings.json ~/Library/Application\ Support/Code/User/ &> /dev/null

echo "  > Installing Visual Studio Code extensions..."
while read -r line; do code --install-extension "$line"; done <./.extra/vscode/extensions &> /dev/null

unset BREW_PACKAGES
unset install_brew_packages
unset install_brew_cask_packages
source ~/.zshrc

echo "==> Done with setup."
