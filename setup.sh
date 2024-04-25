#!/bin/bash

# This file installs software then delegates to other scripts that might be
# executed more frequently.

# create a source code directory
println "Creating ~/repos to house source code"
mkdir -p ~/repos

# install sh -c https://ohmyz.sh/#install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install zsh-users/antigen plugin manager for zsh
curl -L git.io/antigen > antigen.zsh
cp antigen.zsh ~/antigen.zsh

# install brew if needed
if ! command -v brew &> /dev/null
then
    printf "\nbrew needs to be installed\n"
    export PATH=$PATH:/opt/homebrew/bin 
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"   
fi
echo -e "\nUpdating brew...\n"
brew update

## BEGIN PROGRAM INSTALLATON

echo -e "\nInstalling zoxide for improved terminal navigation\n"
brew install zoxide

echo -e "\ninstalling neovim for text editing\n"
brew install neovim

echo -e "\ninstalling nerdfonts icons in nvim\n"
brew tap homebrew/cask-fonts
brew install font-meslo-lg-nerd-font

echo -e "\nInstalling ripgrep for fast grep\n"
brew install ripgrep

echo -e "\nInstalling AltTab to improve window switching on Mac\n"
brew install --cask alt-tab

echo -e "\nInstalling node\n"
brew install node
brew install corepack

pnpm add --save-dev --save-exact @biomejs/biome

echo -e "\nInstalling Fast Node Switcher\n"
curl -fsSL https://fnm.vercel.app/install | bash

echo -e "\nInstalling Go\n"
brew install golang
brew install golangci-lint
brew upgrade golangci-lint

echo -e "\nInstalling Rust\n"
brew install rust

echo -e "\nInstalling zellij"
cargo install --locked zellij

# setup the terminal
sh ~/dotfiles/setup-terminal.sh
sh ~/dotfiles/setup-nvim.sh

echo -e "\nNow, you probably want to open settings for iTerm2 and verify your font is\n\n'MesloLGS Nerd Font Mono' or 'JetBrainsMono Nerd Font Mono'\n"
