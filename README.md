# Installation
Prerequisites:
```
pip (python3-pip)
starship
python3-devel
oh my fish
delta
```

Run in fish shell:
``` shell
git clone --bare git@github.com:LeonMatthes/Dotfiles.git $HOME/.dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
dotfiles checkout
dotfiles submodule update --init --recursive
dotfiles config status.showUntrackedFiles no
$HOME/.config/dotfiles/install.fish
```
