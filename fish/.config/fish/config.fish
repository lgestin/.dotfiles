if status is-interactive
    fish_add_path /opt/homebrew/bin
    fish_add_path $HOME/.local/bin
    fish_add_path $HOME/.cargo/bin
    fish_add_path "$HOME/Library/Application Support/hatch/pythons/3.12/python/bin"

    if set -q SSH_CONNECTION
        set -gx EDITOR vim
    else
        set -gx EDITOR nvim
    end

    fish_vi_key_bindings
    alias vim=nvim

    if type -q fzf
        fzf --fish | source
    end
end
