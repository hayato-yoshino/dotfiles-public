#!/bin/bash

# init.sh が実行されたパスを取得
DIR=$(cd $(dirname $0) && pwd)

# 既存の bash 設定ファイルのバックアップを取る
if [ -f $HOME/.bashrc ]; then
    mv $HOME/.bashrc $HOME/.bashrc.backup
fi

# bash 設定ファイルをシンボリックリンクで配置
ln -s $DIR/.bashrc $HOME/.bashrc

