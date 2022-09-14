# User specific environment
function add_path
    contains $argv $fish_user_paths; or set -Ua fish_user_paths $argv
end
add_path $HOME/.local/bin
add_path $HOME/bin
add_path $HOME/.cargo/bin

# User specific aliases and functions
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias open="xdg-open"
alias f='fuck'
alias rm='echo "This is not the command you\'re looking for! Use trash <file> instead!"; :'
alias ll='ls -Al'
alias clip='xclip -selection clipboard'
alias open='xdg-open'
starship init fish | source

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# source local (per computer) config
if test -f "$HOME/.config/fish/local_config.fish"; source "$HOME/.config/fish/local_config.fish"; end

# This is meant to be bound to something like \cC.
function __fish_cancel_commandline
    # Close the pager if it's open (#4298)
    commandline -f cancel

    set -l cmd (commandline)
    if test -n "$cmd"
        commandline -C 1000000
        if set -q fish_color_cancel
            echo -ns (set_color $fish_color_cancel) "^C" (set_color normal)
        else
            echo -ns "^C"
        end
        if command -sq tput
            # Clear to EOL (to erase any autosuggestion).
            echo -n (tput el; or tput ce)
        end
        for i in (seq (commandline -L))
            echo ""
        end
        commandline ""
        commandline -f execute
    end
end

function fish_user_key_bindings
    # Fix strange <C-c>-Behavior with multiline prompt
    bind \cc '__fish_cancel_commandline'
end
