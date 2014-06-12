vaxXxa's dotfiles
=================

Pre-installation
----------------

1. Install Homebrew_.
2. Install unix shell – zsh_ (Z shell) and set ``zsh`` as your default shell.
3. Install zsh configuration framework oh-my-zsh_.


Installation
------------

You can clone the repository wherever you want (I like to keep it in ``~/Documents/Projects/dotfiles``). The bootstrapper script will pull in the latest version and copy the files to your home folder.

.. code:: bash

    $ git clone https://github.com/vaxXxa/dotfiles.git && cd dotfiles && make

To update, ``cd`` into your local ``dotfiles`` repository and then:

.. code:: bash

    $ make


Add custom commands without creating a new fork
-----------------------------------------------

If ``~/.extra/.zsh/local.sh`` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My ``~/.extra/.zsh/local.sh`` looks something like this:

.. code:: bash

    # Git credentials
    git config --global user.name "Vasyl Nakvasiuk"
    git config --global user.email "vaxxxa@gmail.com"

    # Go environment
    export GOROOT=/usr/local/go
    export GOPATH=$HOME/Documents/Projects/gocode
    export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

    source /usr/local/bin/virtualenvwrapper.sh

You can overwrite something using ``~/.extra/.zsh/local.sh``. For example:

.. code:: bash

    # Overwrite alias
    alias p="cd ~/Projects"

    # Overwrite environment variable
    export EDITOR="emacs"

Or you can extend all your dotfiles configuration using ``~/.extra/.zsh/local.sh`` like entry point. Your ``~/.extra/.zsh/local.sh`` can be like this:

.. code:: bash

    for file in ~/.extra/.zsh/{local-exports,local-aliases,local-work-settings}.sh; do
        [ -r "$file" ] && source "$file"
    done
    unset file

And in ``~/.extra/.zsh/local-exports.sh``, ``~/.extra/.zsh/local-aliases.sh``, ``~/.extra/.zsh/local-work-settings.sh`` you can add your own custom commands.


Thanks to...
------------

`Mathias Bynens`_ for sharing his `amazing collection of dotfiles`_.

`Chris Hunt`_ for nice `dotfiles collection`_.

`Chris Kempson`_ for awesome `color schemes`_.

.. _brew: http://brew.sh/
.. _zsh: http://www.zsh.org/
.. _oh-my-zsh: https://github.com/robbyrussell/oh-my-zsh
.. _Mathias Bynens: https://github.com/mathiasbynens
.. _amazing collection of dotfiles: https://github.com/mathiasbynens/dotfiles
.. _Chris Hunt: https://github.com/chrishunt
.. _dotfiles collection: https://github.com/chrishunt/dot-files
.. _Chris Kempson: https://github.com/chriskempson
.. _color schemes: https://github.com/chriskempson/base16