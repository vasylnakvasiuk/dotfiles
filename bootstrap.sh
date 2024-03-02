#!/usr/bin/env zsh

BREW_PACKAGES=(zsh bash powerlevel10k
               git git-extras lazygit gitui tig topgrade neovim kakoune helix
               mc lf ranger xplr htop bottom btop bpytop ctop hacker1024/hacker1024/coretemp
               nmap rustscan arp-scan arpoison ettercap tcpflow spoof-mac mitmproxy proxychains-ng
               wget wireshark termshark mtr iperf3 teamookla/speedtest/speedtest socat wrk hyperfine tor
               tree rg fd wader/tap/fq yq jq jid zellij tmux reattach-to-user-namespace
               figlet fzf sk ncdu dust duf watch entr fswatch watchman pwgen coreutils
               zoxide m-cli httpie diff-so-fancy git-delta difftastic afnanenayet/tap/diffsitter
               go grc bat eth-p/software/bat-extras prettyping gping tealdeer noti exa lsd
               navi procs lazydocker dive neofetch macchina direnv code-minimap zk nap
               cmatrix tty-clock mhzawadi/cbonsai/cbonsai pipes-sh asciiquarium
               zsh-autosuggestions zsh-completions zsh-syntax-highlighting)

CASK_PACKAGES=(wezterm keycastr anybar wireshark android-platform-tools
               vlc rectangle maccy monitorcontrol zed
               homebrew/cask-fonts/font-hack homebrew/cask-fonts/font-hack-nerd-font
               homebrew/cask-fonts/font-fira-code homebrew/cask-fonts/font-fira-code-nerd-font
               homebrew/cask-fonts/font-jetbrains-mono homebrew/cask-fonts/font-jetbrains-mono-nerd-font
               homebrew/cask-fonts/font-iosevka homebrew/cask-fonts/font-iosevka-nerd-font)

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
rsync --exclude ".git/" --exclude ".DS_Store" --exclude "Makefile" --exclude "bootstrap.sh" --exclude "README.rst" --exclude "screenshot-general.png" --exclude "screenshot-neovim.png" --exclude "TODO" --exclude ".extra/vscode/" -av . ~ &> /dev/null

echo "  > Sync Visual Studio Code..."
rsync --exclude ".DS_Store" -av ./.extra/vscode/settings.json ~/Library/Application\ Support/Code/User/ &> /dev/null

echo "  > Installing Visual Studio Code extensions..."
while read -r line; do code --install-extension "$line"; done <./.extra/vscode/extensions &> /dev/null

echo "  > Install fzf auto-completion and key bindings"
$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc --no-bash &> /dev/null

unset BREW_PACKAGES
unset install_brew_packages
unset install_brew_cask_packages
source ~/.zshrc

echo "==> Done with setup."
