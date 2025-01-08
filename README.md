DotFiles
===============

My personal dotfiles for bash/*nix environments.

Includes:
- .bashrc
- .gitconfig
- .vimrc
- .vim/autoload/plug.vim

## Requirements

To support YouCompleteMe, must be vim >= 9.1.0016 and on a system with APT package
manager. Otherwise, errors may occur. Manually remove the YouCompleteMe plugin from
the vimrc file before running `./install` or `:PlugInstall` if this is the case.

## Installation

Simply run:
```bash
git clone git@github.com:RooHTaylor/dotfiles.git
cd dotfiles
./install
```
