#!/bin/bash

# 指定目标目录
DEST_DIR="./configs-backup"

# 复制配置文件到目标目录
cp ~/.vimrc $DEST_DIR
cp ~/.bashrc $DEST_DIR
cp ~/.tmux.conf $DEST_DIR
cp ~/.zshrc $DEST_DIR
cp ~/.p10k.zsh $DEST_DIR
cp -r ~/.oh-my-zsh $DEST_DIR

# 输出复制完成的消息
echo "配置文件已复制到 $DEST_DIR"





