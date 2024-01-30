#!/bin/bash

# 指定目标目录
DEST_DIR="./01-configs-backup"

# 复制文件到目标目录
copy_file() {
    local source_file=$1
    local dest_dir=$2

    if [ -f "$source_file" ]; then
        cp "$source_file" "$dest_dir"
        echo "已复制文件: $source_file"
    else
        echo "文件不存在: $source_file"
    fi
}

# 复制配置文件到目标目录
copy_file ~/.vimrc "$DEST_DIR"
copy_file ~/.bashrc "$DEST_DIR"
copy_file ~/.tmux.conf "$DEST_DIR"
copy_file ~/.zshrc "$DEST_DIR"
copy_file ~/.p10k.zsh "$DEST_DIR"
copy_file ~/.oh-my-zsh/{.,} "$DEST_DIR"

# 输出复制完成的消息
echo "配置文件已复制到 $DEST_DIR"
