#!/bin/zsh

cp -r .zsh        ~/.zsh
cp -r .vim        ~/.vim
cp -r .tmux.conf  ~/.tmux.conf
cp .vimrc         ~/.vimrc
cp .gitconfig     ~/.gitconfig

rm -rf ${ZDOTDIR:-$HOME}/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ${ZDOTDIR:-$HOME}/.zshrc

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
echo "source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

mkdir -p ~/.zsh/git/
wget -O ~/.zsh/git/git.zsh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/lib/git.zsh
echo "source ~/.zsh/git/git.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

mkdir -p ~/.zsh/z/
wget -O ~/.zsh/z/z.sh https://raw.githubusercontent.com/rupa/z/master/z.sh
echo "source ~/.zsh/z/z.sh" >> ${ZDOTDIR:-$HOME}/.zshrc

git clone https://github.com/powerline/fonts.git
cd fonts && ./install.sh
cd .. && rm -rf fonts

echo "export EDITOR=vim" >> ${ZDOTDIR:-$HOME}/.zshrc

echo "autoload -Uz compinit" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "compinit" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "zstyle ':completion:*' menu select" >> ${ZDOTDIR:-$HOME}/.zshrc

echo "autoload -U history-search-end" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "zle -N history-beginning-search-backward-end history-search-end" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "zle -N history-beginning-search-forward-end history-search-end" >> ${ZDOTDIR:-$HOME}/.zshrc
echo 'bindkey "^[[A" history-beginning-search-backward-end' >> ${ZDOTDIR:-$HOME}/.zshrc
echo 'bindkey "^[[B" history-beginning-search-forward-end' >> ${ZDOTDIR:-$HOME}/.zshrc


echo "source ~/.zsh/agnoster-patrick.zsh-theme" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "setopt prompt_subst" >> ${ZDOTDIR:-$HOME}/.zshrc

echo 'bindkey "^[[1;3C" forward-word' >> ${ZDOTDIR:-$HOME}/.zshrc
echo 'bindkey "^[[1;3D" backward-word' >> ${ZDOTDIR:-$HOME}/.zshrc

echo "ZSH_THEME_GIT_PROMPT_DIRTY=' '" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "alias gst='git status'" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "alias size='f(){ du -sh $1* | sort -hr; }; f'" >> ${ZDOTDIR:-$HOME}/.zshrc
echo 'export GPG_TTY=$(tty)' >> ${ZDOTDIR:-$HOME}/.zshrc

echo "HISTFILE=~/.zsh_history" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "HISTSIZE=2147483647" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "SAVEHIST=2147483647" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "HISTTIMEFORMAT=\"[%F %T] \"" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "setopt extended_history" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "setopt share_history" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "setopt extended_history" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "setopt hist_ignore_dups" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "setopt hist_expire_dups_first" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "setopt hist_verify" >> ${ZDOTDIR:-$HOME}/.zshrc

echo -n "install gcc/g++?[y/n]"
read INSTALLGCC
if [[ $INSTALLGCC =~ ^[Yy]$ ]] then
  sudo dnf install make automake gcc gcc-c++ kernel-devel
fi

echo -n "install java?[y/n]"
read INSTALLJAVA
if [[ $INSTALLJAVA =~ ^[Yy]$ ]] then
  sudo dnf install java-1.8.0-openjdk-devel java-11-openjdk-devel java-latest-openjdk-devel
  echo "export JAVA_HOME=$(dirname $(dirname $(readlink $(readlink $(which javac)))))" >> ${ZDOTDIR:-$HOME}/.zshrc
fi

echo -n "install latex?[y/n]"
read INSTALLLATEX
if [[ $INSTALLLATEX =~ ^[Yy]$ ]] then
  sudo dnf install texlive-scheme-full google-noto-cjk-fonts
fi
