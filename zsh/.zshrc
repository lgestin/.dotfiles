# zsh is the login shell; hand off to fish for interactive use.
# The loop guard checks the parent process rather than an exported marker: an
# exported one is inherited by the tmux server and handed to every new pane, so
# panes would skip the handoff and sit in bare zsh. The parent is fish only when
# zsh was started from within fish, which is exactly when we want to stay put.
if [[ -o interactive ]] && [[ "${$(ps -o comm= -p $PPID 2>/dev/null)}" != *fish* ]]; then
  for _fish in "${commands[fish]}" /opt/homebrew/bin/fish /usr/bin/fish /usr/local/bin/fish; do
    if [[ -n "$_fish" && -x "$_fish" ]]; then
      exec "$_fish"
    fi
  done
  unset _fish
fi

# bare zsh fallback (fish unavailable, or `zsh` run from within fish)
export PATH="/opt/homebrew/bin:$PATH"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias vim=nvim
