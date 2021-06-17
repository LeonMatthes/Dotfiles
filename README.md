# Installation

Run in fish shell:
``` shell
git clone --bare git@github.com:LeonMatthes/Dotfiles.git $HOME/.dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
dotfiles submodule update --init --recursive
dotfiles checkout
dotfiles config status.showUntrackedFiles no
$HOME/.config/dotfiles/install.fish
```
