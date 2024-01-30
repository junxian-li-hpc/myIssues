#!/bin/bash


install_zsh() {
    if command -v zsh &>/dev/null; then
        echo "Zsh is already installed."
    else
        mkdir -p ~/Applications/zsh-5.9
        # 下载源码并把压缩包命名为zsh.tar.xz

        # 解压，这里下载下来的是xz格式，要先用xz解压一遍，再用tar解压。
        # tar -xvf zsh.tar.xz
        xz -d zsh.tar.xz
        tar -xvf zsh.tar 
        cd zsh-5.9        # 注意这个版本号要根据自己的实际情况来

        # 配置与编译。--prefix选项指定安装目录
        ./configure --prefix=$HOME/Applications/zsh-5.9   
        make
        make install
    fi
}


# 复制源文件到目标文件，并备份目标文件
export_zsh_to_bashrc() {
    cd $script_dir
    new_path='$HOME/Applications/zsh-5.9/bin'

    # 检查.bashrc中是否已经存在相同的PATH设置
    if ! grep -qF "export PATH=$new_path:\$PATH" ~/.bashrc; then
        # 将新的PATH设置添加到.bashrc
        echo "export PATH=$new_path:\$PATH" >> ~/.bashrc
        echo "Added PATH to .bashrc"
    else
        echo "PATH already exists in .bashrc"
    fi
    
}


install_oh_my_zsh() {
    cd $script_dir
    # OH_MY_ZSH的路径
    ohmyzsh_path=./oh-my-zsh
    cd $ohmyzsh_path
    echo $PWD
    rm -rf ohmyzsh
    unzip ohmyzsh.zip
    
    dos2unix ./ohmyzsh-offline/offline_install.diff
    cp ./ohmyzsh-offline/offline_install.diff ./ohmyzsh
        
    cd ohmyzsh
    #对目录下的所有文件使用dos2unix
    find . -type f -print0 | xargs -0 dos2unix

    git init
    git apply offline_install.diff
    
    cd tools &&  chmod +x install.sh
    rm -rf $HOME/.oh-my-zsh
    ./install.sh

    dos2unix ~/.oh-my-zsh/lib/spectrum.zsh 
    file="$HOME/.oh-my-zsh/lib/spectrum.zsh"
    output_file="$HOME/.oh-my-zsh/lib/spectrum.zsh"
    tr -d '\r' < "$file" > "$output_file"

    # find $HOME/.oh-my-zsh -type f -exec dos2unix {} \;

    echo "--------------------------$PWD-------------------------"
    cd ../../..
    source ../01-configs-backup/copy.sh 0
    copy_src2dst ../01-configs-backup/.zshrc ~/.zshrc
}

install_plugins()
{
    cd $script_dir

    # 安装插件,将本地的文件夹移动
    # zsh-autosuggestions
    find ./plugins -type f -print0 | xargs -0 dos2unix

    cp -r ./plugins/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins
    # zsh-syntax-highlighting
    cp -r ./plugins/zsh-syntax-highlighting $HOME/.oh-my-zsh/custom/plugins

    cp -r ./plugins/powerlevel10k $HOME/.oh-my-zsh/custom/themes

    
}

script_dir=$(dirname "$0")
echo "脚本所在目录：$script_dir"

# 检查参数数量
if [ $# -eq 0 ]; then
    echo "没有传递参数"
    
    install_zsh
    export_zsh_to_bashrc
    source ~/.bashrc

    install_oh_my_zsh

    install_plugins
else
    # 检查参数值
    if [ "$1" -eq 0 ]; then
        echo "参数值为0"
    else
        echo "参数值不为0"
    fi
fi