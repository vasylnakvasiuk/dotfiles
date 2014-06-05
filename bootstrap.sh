#!/usr/bin/env zsh

cd "$(dirname "$0")"

function doIt() {
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "Makefile" --exclude "bootstrap.sh" --exclude "README.rst" -av . ~
}

if [ "$1" = "--force" -o "$1" = "-f" ]; then
    doIt
else
    vared -p "This may overwrite existing files in your home directory. Are you sure? (y/n)" -c REPLY
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt
    fi
fi

unset doIt
source ~/.zshrc