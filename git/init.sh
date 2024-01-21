#!/bin/bash

# init.sh が実行されたパスを取得
DIR=$(cd $(dirname $0) && pwd)

# 既存の git 設定ファイルのバックアップを取る
if [ -f $HOME/.gitconfig ]; then
    mv $HOME/.gitconfig $HOME/.gitconfig.backup
fi

# git 設定ファイルをシンボリックリンクで配置
ln -s $DIR/.gitconfig $HOME/.gitconfig

