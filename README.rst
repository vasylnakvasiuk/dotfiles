vaxXxa's dotfiles
=================


Installation
------------

You can clone the repository wherever you want (I like to keep it in ``~/Documents/Projects/dotfiles``). The bootstrapper script will pull in the latest version and copy the files to your home folder.

.. code:: bash

    $ git clone https://github.com/vaxXxa/dotfiles.git && cd dotfiles && ./bootstrap.sh

To update, ``cd`` into your local ``dotfiles`` repository and then:

.. code:: bash

    $ git pull # optional: pull last version
    $ ./bootstrap.sh

Alternatively, to update while avoiding the confirmation prompt:

.. code:: bash

    $ git pull # optional: pull last version
    $ ./bootstrap.sh -f

or

.. code:: bash

    $ ./bootstrap.sh --force


Git-free install
----------------

To install these dotfiles without Git:

.. code:: bash

    $ cd; curl -#L https://github.com/vaxXxa/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.rst,bootstrap.sh}

To update later on, just run that command again.


Add custom commands without creating a new fork
-----------------------------------------------

If ``~/.extra/.local`` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My ``~/.extra/.local`` looks something like this:

.. code:: bash

    # Git credentials
    git config --global user.name "Vasyl Nakvasiuk"
    git config --global user.email "vaxxxa@gmail.com"

    # Go environment
    export GOROOT=/usr/local/go
    export GOPATH=$HOME/Documents/Projects/gocode
    export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

    source /usr/local/bin/virtualenvwrapper.sh

You can overwrite something using ``~/.extra/.local``. For example:

.. code:: bash

    # Overwrite alias
    alias p="cd ~/Projects"

    # Overwrite environment variable
    export EDITOR="emacs"

Or you can extend all your dotfiles configuration using ``~/.extra/.local`` like entry point. Your ``~/.extra/.local`` can be like this:

.. code:: bash

    for file in ~/.extra/.{local-exports,local-aliases,work-settings}; do
        [ -r "$file" ] && source "$file"
    done
    unset file

And in ``~/.extra/.local-exports``, ``~/.extra/.local-aliases``, ``~/.extra/.work-settings`` you can add your own custom commands.


Thanks to...
------------

`Mathias Bynens <https://github.com/mathiasbynens>`_ for sharing his `amazing collection of dotfiles <https://github.com/mathiasbynens/dotfiles>`_.