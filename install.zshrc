#!/usr/bin/env zsh

# setup zsh
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/code/dotfiles/zsh/zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# setup tmux
setopt EXTENDED_GLOB
for tmuxconf in "${ZDOTDIR:-$HOME}"/code/dotfiles/tmux/tmux.conf; do
  ln -s "$tmuxconf" "${ZDOTDIR:-$HOME}/.${tmuxconf:t}"
done

# install xclip, required for tmux copying
sudo apt install xclip

# setup color schemes
mkdir -p ~/.local/share/xfce4/terminal/colorschemes/
cp tmux/base16-ocean.16.theme ~/.local/share/xfce4/terminal/colorschemes/
