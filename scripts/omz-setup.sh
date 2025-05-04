#!/bin/bash
set -e  # Exit on any error

# Colors for better output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Starting Oh My Zsh and plugins setup...${NC}"

# Check if Oh My Zsh is already installed
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo -e "${YELLOW}Oh My Zsh is already installed.${NC}"
else
    echo -e "${GREEN}Installing Oh My Zsh...${NC}"
    # Backup existing .zshrc if it exists
    if [ -f "$HOME/.zshrc" ]; then
        echo "Backing up existing .zshrc to .zshrc.pre-oh-my-zsh"
        mv "$HOME/.zshrc" "$HOME/.zshrc.pre-oh-my-zsh"
    fi
    
    # Install Oh My Zsh
    

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    echo -e "${GREEN}Oh My Zsh installed successfully!${NC}"
fi

# Install custom Oh My Zsh plugins
ZSH_CUSTOM=${ZSH_CUSTOM:-"$HOME/.oh-my-zsh/custom"}
echo -e "${BLUE}Installing custom plugins to $ZSH_CUSTOM...${NC}"

# zsh-autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
    echo "zsh-autosuggestions already installed."
fi

# zsh-syntax-highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    echo "Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
    echo "zsh-syntax-highlighting already installed."
fi

# zsh-history-substring-search
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-history-substring-search" ]; then
    echo "Installing zsh-history-substring-search..."
    git clone https://github.com/zsh-users/zsh-history-substring-search.git "$ZSH_CUSTOM/plugins/zsh-history-substring-search"
else
    echo "zsh-history-substring-search already installed."
fi

# fzf plugin - check if fzf is installed first
if command -v fzf >/dev/null 2>&1; then
    echo "fzf detected, activating fzf plugin..."
else
    echo -e "${YELLOW}fzf not found. Consider installing it:${NC}"
    if [[ "$(uname)" == "Darwin" ]]; then
        echo "  brew install fzf"
    elif [[ "$(uname)" == "Linux" ]]; then
        echo "  sudo apt install fzf    # For Debian/Ubuntu"
        echo "  sudo dnf install fzf    # For Fedora"
    fi
fi

echo -e "${GREEN}Custom Oh My Zsh plugins installed!${NC}"
echo -e "${GREEN}Setup complete!${NC}"
