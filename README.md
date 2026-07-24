# Install GNU Stow

```sh
sudo apt install stow
```

```sh
brew install stow
```

# Install packages


```sh
sudo apt install curl zsh fish git ssh tmux neovim
``` 

```sh
brew install curl zsh fish git tmux neovim
``` 

### Configs

```sh
cd
git clone git@github.com:lgestin/.dotfiles.git ~/.dotfiles
```

```sh
cd ~/.dotfiles
stow zsh
stow fish
stow git
stow nvim
stow tmux
```

### Shells

zsh is the **login** shell (so `~/.zprofile` keeps handling ssh-agent, PATH,
etc.), while fish is the **interactive** shell and owns the whole interactive
experience — prompt, completions, keybindings, vi mode, fzf (see
`fish/.config/fish`).

The hand-off is a guarded `exec fish` at the top of `zsh/.zshrc`. Everything
after it is a deliberately minimal bare-zsh fallback, reached only when fish is
unavailable or when you run `zsh` explicitly from within fish. There is no
oh-my-zsh or powerlevel10k — fish provides those features natively.

Scripts and other non-interactive shells still get plain zsh. Running `zsh` from
inside fish drops you into a real zsh session rather than looping back to fish.

#### Secrets / per-machine config

The tracked rc files carry no secrets. Anything private or machine-specific goes
in git-ignored `*.local` files in `$HOME`, sourced automatically if present:

- `~/.zprofile.local` — login-time secrets: ssh keys to load, employer-specific
  bits, tokens/API keys, one-off PATH entries.
- `~/.zshenv.local` — same, but for every zsh (login, interactive, scripts).

These are **not** in the repo, so recreate them by hand on a new machine, e.g.:

```sh
cat > ~/.zprofile.local <<'EOF'
ssh-add --apple-use-keychain ~/.ssh/id_rsa.<name> 2>/dev/null
export SOME_TOKEN=...
EOF
```

