# Installation

Run in fish:
``` shell
git clone --bare git@github.com:LeonMatthes/Dotfiles.git $HOME/.dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
dotfiles checkout
```
