# zsh is the login shell; hand off to fish for interactive use.
if [[ -o interactive ]] && [[ -z "$FISH_LAUNCHED" ]] && [[ -x /opt/homebrew/bin/fish ]]; then
  export FISH_LAUNCHED=1
  exec /opt/homebrew/bin/fish
fi

# bare zsh fallback (fish unavailable, or `zsh` run from within fish)
export PATH="/opt/homebrew/bin:$PATH"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias vim=nvim
