#!/bin/bash

#
if [[ linux ]]; then
    sudo apt install zsh
    sudo apt install curl
    sudo apt install git
fi
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Rustup
/bin/bash -c "$(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs)"

# github cli
brew install gh

# Rust Cli tools
cargo install bat git-delta exa fd-find ripgrep sd tokei zoxide

gh repo clone jrmoulton/Config ~/Config
if [[ -d "$HOME/.config" ]]; then
    mkdir ~/.config
fi
ln -s $HOME/Config/* $HOME/.config/
echo "$(rm $HOME/.zshrc)" >/dev/stderr
ln -s $HOME/Config/.zshrc $HOME/.zshrc

