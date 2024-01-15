#!/bin/bash

# init.sh が実行されたパスを取得
DIR=$(cd $(dirname $0) && pwd)

# tmux 設定ファイル配置場所を作成
if [ ! -d $HOME/.config/tmux ]; then
	mkdir -p $HOME/.config/tmux
fi

# 既存の tmux 設定ファイルのバックアップを取る
if [ -f $HOME/.config/tmux/tmux.conf ]; then
	mv $HOME/.config/tmux/tmux.conf $HOME/.config/tmux/tmux.conf.backup
fi

# tmux 設定ファイルをシンボリックリンクで配置
ln -s $DIR/tmux.conf $HOME/.config/tmux/tmux.conf

