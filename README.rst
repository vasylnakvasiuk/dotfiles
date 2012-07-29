vaxXxa's dotfiles
=================

Installation
------------

You can clone the repository wherever you want. (I like to keep it in `~/Documents/Developing/Projects/active/dotfiles`, with `~/dotfiles` as a symlink.) The bootstrapper script will pull in the latest version and copy the files to your home folder.
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