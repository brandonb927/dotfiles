#! /bin/sh

# Install zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# copy zsh files
cp zsh/zshrc ~/.zshrc
cp zsh/zprofile ~/.zprofile
cat zsh/aliases >> ~/.zprofile

# copy ZSH theme
cp zsh/brandonbrown.zsh-theme ~/.oh-my-zsh/themes/brandonbrown.zsh-theme

# copy git files
cp gitconfig ~/.gitconfig
cp gitignore ~/.gitignore