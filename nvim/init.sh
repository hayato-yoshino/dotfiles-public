#!/bin/bash

# init.sh が実行されたパスを取得
DIR=$(cd $(dirname $0) && pwd)

# nvim 設定ファイル配置場所を作成
if [ ! -d $HOME/.config/nvim ]; then
    mkdir -p $HOME/.config/nvim
fi

# 既存の nvim 設定ファイルのバックアップを取る
if [ -f $HOME/.config/nvim/init.vim ]; then
    mv $HOME/.config/nvim/init.vim $HOME/.config/nvim/init.vim.backup
fi

# nvim 設定ファイルをシンボリックリンクで配置
ln -s $DIR/init.vim $HOME/.config/nvim/init.vim
