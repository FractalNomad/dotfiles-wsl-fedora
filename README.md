# dotfiles-wsl-fedora

Reusable dotfiles and config for my WSL Fedora environment.

## Layout
- `home/` – files that live directly in `$HOME` (e.g. `.zshrc`, `.gitconfig`, `.p10k.zsh`, `.ssh/config`).
- `config/` – subdirectories that map to `$HOME/.config` (e.g. `nvim`, `ghostty`, `zellij`, `lsd`).
- `fedora_setup.md` – notes and commands for setting up Fedora (packages, shells, tools).
- `ghostty_setup.sh` – helper script to build and install Ghostty on Fedora.

## Usage
Clone this repo, `cd` into it and run:

```bash
bash install.sh
```

This will (re)symlink the tracked dotfiles into your `$HOME` and `~/.config` based on this repo's contents.