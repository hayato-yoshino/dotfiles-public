#!/bin/bash

# init.sh が実行されたパスを取得
DIR=$(cd $(dirname $0) && pwd)

# 既存の fish 設定ファイルのバックアップを取る
if [ -f $HOME/.config/fish/config.fish ]; then
    mv $HOME/.config/fish/config.fish $HOME/.config/fish/config.fish.backup
fi

# fish 設定ファイルをシンボリックリンクで配置
ln -s $DIR/config.fish $HOME/.config/fish/config.fish

source $HOME/.config/fish/config.fish
