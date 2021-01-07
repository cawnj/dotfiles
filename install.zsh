#!/bin/zsh

rm -f ~/.zprezto/runcoms/zpreztorc
cp zsh/zpreztorc ~/.zprezto/runcoms/

rm -f ~/.zprezto/runcoms/zshrc
cp zsh/zshrc ~/.zprezto/runcoms/

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

rm ~/.tmux.conf
cp tmux/tmux.conf ~/.tmux.conf