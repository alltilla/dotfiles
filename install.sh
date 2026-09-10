#!/usr/bin/env bash
# Link this checkout into $HOME. Safe to rerun. macOS and Linux.
set -eu

repo=$(cd "$(dirname "$0")" && pwd)

link() {
  local src="$repo/$1" dst="$2"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    mv "$dst" "$dst.bak"
    echo "moved $dst to $dst.bak"
  fi
  mkdir -p "$(dirname "$dst")"
  ln -sfn "$src" "$dst"
  echo "linked $dst"
}

link .bashrc    "$HOME/.bashrc"
link .gitconfig "$HOME/.gitconfig"
link .tigrc     "$HOME/.tigrc"
link .gdbinit   "$HOME/.gdbinit"
link .tmux.conf "$HOME/.tmux.conf"
link fish       "$HOME/.config/fish"
link ghostty    "$HOME/.config/ghostty"
link git/hooks  "$HOME/.config/git/hooks"

if [ "$(uname)" = Darwin ] && command -v brew >/dev/null; then
  brew install fish gh tig tmux
  brew install --cask ghostty
fi

# ghostty/config names this font.
case $(uname) in
  Darwin) fontdir="$HOME/Library/Fonts" ;;
  *)      fontdir="$HOME/.local/share/fonts" ;;
esac
if ! ls "$fontdir" 2>/dev/null | grep -qi 'meslolgs.nf'; then
  mkdir -p "$fontdir"
  for style in Regular Bold Italic "Bold Italic"; do
    curl -fsSL -o "$fontdir/MesloLGS NF $style.ttf" \
      "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20${style// /%20}.ttf"
  done
  echo "installed MesloLGS NF into $fontdir"
fi

# Prompt and colour settings are fish universal variables, which live in
# the untracked fish_variables. Apply the tracked snapshot once.
if command -v fish >/dev/null; then
  fish "$repo/fish/universal-vars.fish"
  echo "applied fish/universal-vars.fish"
fi

if [ "$(uname)" = Darwin ]; then
  fishbin=$(command -v fish || true)
  if [ -n "$fishbin" ] && ! grep -qx "$fishbin" /etc/shells; then
    echo "to make fish the login shell:"
    echo "  echo $fishbin | sudo tee -a /etc/shells && chsh -s $fishbin"
  fi
fi
