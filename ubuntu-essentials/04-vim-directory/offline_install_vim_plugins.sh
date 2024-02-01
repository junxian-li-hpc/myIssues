#!/bin/bash

install_nerdtree() {
    vim_dir="$HOME/.vim"
    mkdir -p ~/.vim/pack/vendor/start
    cd plugins
    find . -type f -exec dos2unix {} \;
    cp -r nerdtree $vim_dir/pack/vendor/start
  
}

script_dir=$(dirname "$0")
echo "脚本所在目录：$script_dir"

# 检查参数数量
if [ $# -eq 0 ]; then
    echo "没有传递参数"   
    install_nerdtree
else
    # 检查参数值
    if [ "$1" -eq 0 ]; then
        echo "参数值为0"
    else
        echo "参数值不为0"
    fi
fi