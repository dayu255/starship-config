#!/bin/bash

# スクリプトがあるディレクトリの絶対パスを取得
DOT_DIR=$(cd $(dirname $0); pwd)
DEST="$HOME/.config/starship.toml"

mkdir -p "$HOME/.config"

# すでにファイルが存在し、かつシンボリックリンクではない場合はバックアップ
if [ -f "$DEST" ] && [ ! -L "$DEST" ]; then
    echo "Backing up existing starship.toml to starship.toml.bak"
    mv "$DEST" "$DEST.bak"
fi

# シンボリックリンクを作成（-s: symbolic, -f: force, -v: verbose）
ln -sfv "$DOT_DIR/starship.toml" "$DEST"
