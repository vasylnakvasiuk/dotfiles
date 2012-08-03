vaxXxa's dotfiles
=================

Installation
------------

You can clone the repository wherever you want. (I like to keep it in ``~/Documents/Developing/Projects/active/dotfiles``, with ``~/dotfiles`` as a symlink.) The bootstrapper script will pull in the latest version and copy the files to your home folder.
::

    git clone https://github.com/vaxXxa/dotfiles.git && cd dotfiles && ./bootstrap.sh

To update, ``cd`` into your local ``dotfiles`` repository and then::

    ./bootstrap.sh

Alternatively, to update while avoiding the confirmation prompt::

    ./bootstrap.sh -f

Git-free install
----------------

To install these dotfiles without Git::

    cd; curl -#L https://github.com/vaxXxa/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.rst,bootstrap.sh}

To update later on, just run that command again.

Add custom commands without creating a new fork
-----------------------------------------------

If `~/.extra/.local` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra/.local` looks something like this::

    # Git credentials
    # Not in the repository, to prevent people from accidentally committing under my name
    GIT_AUTHOR_NAME="Vasyl Nakvasiuk"
    GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
    git config --global user.name "$GIT_AUTHOR_NAME"
    GIT_AUTHOR_EMAIL="vaxxxa@gmail.com"
    GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
    git config --global user.email "$GIT_AUTHOR_EMAIL"

Or you extend all your dotfiles configuration using `~/.extra/.local` like entry point. Your `~/.extra/.local` might be like this one::

    for file in ~/.extra/.{local-exports,local-aliases,work-settings}; do
        [ -r "$file" ] && source "$file"
    done
    unset file

And in `~/.extra/.local-exports`, `~/.extra/.local-aliases`, `~/.extra/.work-settings` you can add you own custom commands.


Thanks to...
------------

`Mathias Bynens <https://github.com/mathiasbynens>`_ for sharing his `amazing collection of dotfiles <https://github.com/mathiasbynens/dotfiles>`_