#!/usr/bin/env zsh

BREW_PACKAGES=(zsh git git-extras topgrade micro neovim kakoune helix mc lf ranger xplr
               htop bottom btop bpytop ctop hacker1024/hacker1024/coretemp
               nmap rustscan arp-scan arpoison ettercap tcpflow spoof-mac tor proxychains-ng
               wget wireshark termshark mtr iperf3 speedtest socat wrk hyperfine
               tree rg fd yq jq jid tmux reattach-to-user-namespace
               cmatrix figlet fzf sk ncdu dust duf watch entr fswatch watchman pwgen coreutils
               zoxide m-cli httpie diff-so-fancy delta difftastic afnanenayet/tap/diffsitter
               go grc bat eth-p/software/bat-extras prettyping tldr noti exa lsd
               lazygit gitui navi procs podman podman-desktop lazydocker dive)
CASK_PACKAGES=(keycastr font-hack font-hack-nerd-font font-fira-code font-fira-code-nerd-font anybar)

function tap_brew_packages() {
    brew tap | grep teamookla/speedtest > /dev/null || brew tap teamookla/speedtest
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
        brew install --cask $index &> /dev/null
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

echo "  > Taping homebrew packages..."
tap_brew_packages

echo "  > Updating homebrew..."
brew update &> /dev/null

echo "  > Installing homebrew packages..."
install_brew_packages

echo "  > Installing homebrew cask packages..."
install_brew_cask_packages

echo "  > Upgrading homebrew..."
brew upgrade &> /dev/null

echo "  > Upgrading homebrew cask..."
brew upgrade --cask &> /dev/null

echo "  > Sync dotfiles..."
rsync --exclude ".git/" --exclude ".DS_Store" --exclude "Makefile" --exclude "bootstrap.sh" --exclude "README.rst" --exclude "screenshot-general.png" --exclude "screenshot-neovim.png" --exclude "screenshot-iterm2-fonts.png" --exclude "TODO" --exclude ".extra/vscode/" -av . ~ &> /dev/null

echo "  > Sync Visual Studio Code..."
rsync --exclude ".DS_Store" -av ./.extra/vscode/settings.json ~/Library/Application\ Support/Code/User/ &> /dev/null

echo "  > Installing Visual Studio Code extensions..."
while read -r line; do code --install-extension "$line"; done <./.extra/vscode/extensions &> /dev/null

echo "  > Install/update nvim packages"
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

unset BREW_PACKAGES
unset install_brew_packages
unset install_brew_cask_packages
source ~/.zshrc

echo "==> Done with setup."
