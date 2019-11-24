#!/usr/bin/env python3

import i3ipc
import os
from pynput.keyboard import Key, Controller
from time import sleep

i3 = i3ipc.Connection()
focused = i3.get_tree().find_focused()
#  print(focused.focused)
print(os.system('xdotool getactivewindow'))
if focused.window_class == "Alacritty":
    os.system('xdotool key --clearmodifiers ctrl+shift+n')
else:
    os.system('i3-sensible-terminal')
