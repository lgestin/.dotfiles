# Install GNU Stow

```sh
sudo apt install stow
```

```sh
brew install stow
```

# Install packages


```sh
sudo apt install curl zsh git ssh tmux neovim
``` 

```sh
brew install curl zsh git tmux neovim
``` 

### Configs

```sh
cd
git clone git@github.com:lgestin/.dotfiles.git ~/.dotfiles
```

```sh
cd ~/.dotfiles
stow zsh
stow git
stow nvim
stow tmux
```

