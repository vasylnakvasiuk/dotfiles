#!/usr/bin/env zsh

BREW_PACKAGES=(zsh bash powerlevel10k
               git git-extras lazygit gitui tig topgrade neovim kakoune helix
               mc lf ranger xplr yazi htop bottom btop bpytop ctop hacker1024/hacker1024/coretemp
               iproute2mac nmap rustscan arp-scan arpoison ettercap tcpflow spoof-mac mitmproxy proxychains-ng
               sniffnet wireshark termshark mtr iperf3 teamookla/speedtest/speedtest socat wrk hyperfine tor
               tree rg fd wader/tap/fq yq jq jid zellij tmux reattach-to-user-namespace
               figlet fzf sk ncdu dust duf watch entr fswatch watchman pwgen coreutils
               zoxide m-cli httpie wget diff-so-fancy git-delta difftastic afnanenayet/tap/diffsitter
               homebrew/core/go grc bat eth-p/software/bat-extras prettyping gping tealdeer noti eza lsd
               navi procs lazydocker dive neofetch macchina direnv code-minimap zk nap
               cmatrix tty-clock mhzawadi/cbonsai/cbonsai pipes-sh asciiquarium
               zsh-autosuggestions zsh-completions zsh-fast-syntax-highlighting
               py-spy ruff uv
               ffmpegthumbnailer unar poppler exiftool lutzifer/homebrew-tap/keyboardSwitche)

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

function install_tmux_tpm() {
    if [ ! -d ~/.config/tmux/plugins/tpm ] ; then
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
    else
        git -C ~/.config/tmux/plugins/tpm pull
    fi
}

figlet "dotfiles"

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
rsync --exclude ".git/" --exclude ".DS_Store" --exclude "Makefile" --exclude "bootstrap.sh" --exclude "README.md" --exclude "screenshot-general.png" --exclude "screenshot-neovim.png" --exclude "TODO" -av . ~ &> /dev/null

echo "  > Install fzf auto-completion and key bindings"
$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc --no-bash &> /dev/null

echo "  > Manage tmux plugins"

echo "    > Installing Tmux Plugin Manager..."
install_tmux_tpm &> /dev/null

echo "    > Installing TPM (Tmux Plugin Manager) plugins..."
~/.config/tmux/plugins/tpm/bin/install_plugins &> /dev/null

echo "    > Updating TPM (Tmux Plugin Manager) plugins..."
~/.config/tmux/plugins/tpm/bin/update_plugins all &> /dev/null

echo "    > Cleanup TPM (Tmux Plugin Manager) plugins..."
~/.config/tmux/plugins/tpm/bin/clean_plugins &> /dev/null

unset BREW_PACKAGES
unset install_brew_packages
unset install_brew_cask_packages
unset install_tmux_tpm
source ~/.zshrc

echo "==> Done with setup."
