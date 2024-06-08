#!/bin/bash

# init.sh が実行されたパスを取得
DIR=$(cd $(dirname $0) && pwd)

# wezterm 設定ファイル配置場所を作成
if [ ! -d $HOME/.config/wezterm ]; then
    mkdir -p $HOME/.config/wezterm
fi


# 既存の wezterm 設定ファイルのバックアップを取得
if [ -f $HOME/.config/wezterm/wezterm.lua ]; then
    mv $HOME/.config/wezterm/wezterm.lua $HOME/.config/wezterm/wezterm.lua.backup
fi

# wezterm 設定ファイルをシンボリックリンクで配置
ln -s $DIR/wezterm.lua $HOME/.config/wezterm/wezterm.lua
