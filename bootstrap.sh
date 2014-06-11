#!/usr/bin/env zsh

echo "      _       _         __ _ _"
echo "   __| | ___ | |_      / _(_) | ___  ___"
echo "  / _\` |/ _ \| __|____| |_| | |/ _ \/ __|"
echo " | (_| | (_) | ||_____|  _| | |  __/\__ \\"
echo "  \__,_|\___/ \__|    |_| |_|_|\___||___/"
echo ""

echo "==> Here we go..."

cd "$(dirname "$0")"


echo "  > Pulling latest dot-files..."
git pull &> /dev/null

echo "  > Sync dot-files..."
rsync --exclude ".git/" --exclude ".DS_Store" --exclude "Makefile" --exclude "bootstrap.sh" --exclude "README.rst" -av . ~ &> /dev/null


unset doIt
source ~/.zshrc

echo "==> Done with setup."