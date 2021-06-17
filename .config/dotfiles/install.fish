#!/usr/bin/env fish

function inform
  set_color green
  printf "\n###### $argv #########\n"
  set_color normal
end

inform Installing Oh my fish
curl -L https://get.oh-my.fish | fish

omf install fish_logo

inform Installing Vim-Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

inform Installing python modules
sudo pip install pynvim
sudo pip install i3ipc
sudo pip install pynput

inform Changing default shell to fish
chsh -s (which fish)

inform Installing powerline fonts
~/Documents/software/powerline-fonts/install.sh

inform Configuration done - log out and back in

