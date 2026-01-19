#!/usr/bin/env bash
set -euo pipefail

# Simple installer to symlink dotfiles from this repo into $HOME
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local src="$1" dst="$2"
  echo "Linking $dst -> $src"
  mkdir -p "$(dirname "$dst")"
  ln -sfn "$src" "$dst"
}

# Top-level dotfiles
link "$DOTFILES_DIR/home/.zshrc"    "$HOME/.zshrc"
link "$DOTFILES_DIR/home/.gitconfig" "$HOME/.gitconfig"
if [[ -f "$DOTFILES_DIR/home/.p10k.zsh" ]]; then
  link "$DOTFILES_DIR/home/.p10k.zsh" "$HOME/.p10k.zsh"
fi

# SSH config (GitHub-only config, no keys)
if [[ -f "$DOTFILES_DIR/home/.ssh/config" ]]; then
  link "$DOTFILES_DIR/home/.ssh/config" "$HOME/.ssh/config"
fi

# ~/.config subdirectories
for dir in nvim ghostty zellij lsd; do
  if [[ -d "$DOTFILES_DIR/config/$dir" ]]; then
    link "$DOTFILES_DIR/config/$dir" "$HOME/.config/$dir"
  fi
done

echo "Done. Your dotfiles are now linked into $HOME from $DOTFILES_DIR."