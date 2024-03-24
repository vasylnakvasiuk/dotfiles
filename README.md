# Screenshots

![dotfiles](https://raw.githubusercontent.com/vasylnakvasiuk/dotfiles/master/screenshot-general.png)

![vim](https://raw.githubusercontent.com/vasylnakvasiuk/dotfiles/master/screenshot-neovim.png)

# My dotfiles

## Pre-installation

_Note: this setup works only on Mac OS X_

1.  Install [Homebrew](http://brew.sh/).

## Installation

You can clone the repository wherever you want (I like to keep it in
`~/Projects/dotfiles`). The bootstrapper script will pull in the latest
version and copy the files to your home folder.

```bash
$ git clone git@github.com:vasylnakvasiuk/dotfiles.git && cd dotfiles && make
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
$ make
```

## Add custom commands without creating a new fork

If `~/.extra/.zsh/local.zsh` exists, it will be sourced along with the
other files. You can use this to add a few custom commands without the
need to fork this entire repository, or to add commands you don't want
to commit to a public repository.

My `~/.extra/.zsh/local.zsh` looks something like this:

```bash
# Git credentials
git config --global user.name "Vasyl Nakvasiuk"
git config --global user.email "vasyl.nakvasiuk@gmail.com"

# Go environment
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/Projects/gocode
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
```

You can overwrite something using `~/.extra/.zsh/local.zsh`. For
example:

```bash
# Overwrite alias
alias p="cd ~/Documents/Projects"

# Overwrite environment variable
export EDITOR="emacs"
```

Or you can extend all your dotfiles configuration using
`~/.extra/.zsh/local.zsh` like entry point. Your
`~/.extra/.zsh/local.zsh` can be like this:

```bash
for file in ~/.extra/.zsh/{local-exports,local-aliases,local-work-settings}.zsh; do
    [ -r "$file" ] && source "$file"
done
unset file
```

And in `~/.extra/.zsh/local-exports.zsh`,
`~/.extra/.zsh/local-aliases.zsh`,
`~/.extra/.zsh/local-work-settings.zsh` you can add your own custom
commands.

## Colorscheme, font and terminal

I\'m using \"Base16 Eighties Dark 256\" colorscheme and patched [\"Fira
Code\"](https://github.com/tonsky/FiraCode) font called [\"Fira Code
Nerd Font\"](https://github.com/ryanoasis/nerd-fonts). Also my current
terminal emulator is [WezTerm](https://wezfurlong.org/wezterm/).

## Thanks to\...

[Mathias Bynens](https://github.com/mathiasbynens) for sharing his
[amazing collection of
dotfiles](https://github.com/mathiasbynens/dotfiles).

[Chris Hunt](https://github.com/chrishunt) for nice [dotfiles
collection](https://github.com/chrishunt/dot-files).

[Chris Kempson](https://github.com/chriskempson) for awesome [color
schemes](https://github.com/chriskempson/base16).
