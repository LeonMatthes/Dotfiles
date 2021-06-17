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

# Setup KDE + i3
Create a file `/usr/local/bin/plasma-i3.sh`:
```
#!/bin/sh
export KDEWM=/usr/bin/i3
/usr/bin/startplasma-x11
```
And make it executable


Copy this code into the `/usr/share/xsessions/plasma-i3.desktop`:
```
[Desktop Entry]
Type=XSession
Exec=/usr/local/bin/plasma-i3.sh
TryExec=/usr/bin/startplasma-x11
DesktopNames=KDE
Name=Plasma & i3
Comment=Plasma by KDE with i3-gaps
X-KDE-PluginInfo-Version=5.20.5
```
