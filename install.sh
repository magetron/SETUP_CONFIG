#!/bin/zsh

set -x

cp -r .zsh     ~/.zsh
cp .vimrc      ~/.vimrc
cp .gitconfig  ~/.gitconfig

rm -rf ${ZDOTDIR:-$HOME}/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ${ZDOTDIR:-$HOME}/.zshrc

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
echo "source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

mkdir -p ~/.zsh/git/
wget -O ~/.zsh/git/git.zsh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/lib/git.zsh
echo "source ~/.zsh/git/git.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

echo "autoload -Uz compinit" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "compinit" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "zstyle ':completion:*' menu select" >> ${ZDOTDIR:-$HOME}/.zshrc

echo "source ~/.zsh/agnoster-patrick.zsh-theme" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "setopt prompt_subst" >> ${ZDOTDIR:-$HOME}/.zshrc

echo "alias size='f(){ du -sh $1* | sort -hr; }; f'" >> ${ZDOTDIR:-$HOME}/.zshrc
echo 'export GPG_TTY=$(tty)' >> ${ZDOTDIR:-$HOME}/.zshrc
