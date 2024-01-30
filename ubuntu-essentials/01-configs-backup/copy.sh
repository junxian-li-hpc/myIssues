#!/bin/bash
backup_dir=~/my_backups

make_bkup_dir() {
    # 在家目录创建文件夹
    if [[ ! -d $backup_dir ]]; then
        mkdir -p "$backup_dir"
        echo "Backup directory created: $backup_dir"
    else
        echo "Backup directory already exists: $backup_dir"
    fi
}

# 复制源文件到目标文件，并备份目标文件
copy_src2dst() {
    # 指定要追加的源文件和目标.vimrc文件
    src_file="$1"
    target_file="$2"

    dos2unix "$src_file"

    # 如果目标文件不存在，则直接创建
    if [[ ! -f $target_file ]]; then
        cp "$src_file" "$target_file"
        echo "Successfully created $target_file."
    else
        # 备份目标文件，备份名包含日期和时间
        
        #获取 target_file的文件名字
        backup_file="$backup_dir/$(basename $target_file)_$(date +%Y_%m_%d_%H_%M_%S)"
        cp "$target_file" "$backup_file"
        echo "Successfully backed up $target_file to $backup_file."

        # 将源文件内容覆盖写入目标文件
        cat "$src_file" > "$target_file"
        echo "Successfully overwritten $target_file."
    fi
    echo "----------finished------$1---"
    # 如果你想在追加后打开.vimrc进行检查或手动调整，可以添加下面这行：
    # vim "$target_file"
}


# 调用make_bkup_dir函数来创建备份文件夹
make_bkup_dir

# 检查参数数量
if [ $# -eq 0 ]; then
    echo "没有传递参数"
    
    # 调用函数来复制和备份.vimrc文件
    copy_src2dst .vimrc ~/.vimrc
    copy_src2dst .bashrc ~/.bashrc
    source ~/.bashrc
    copy_src2dst .tmux.conf ~/.tmux.conf
    tmux source ~/.tmux.conf

    copy_src2dst .p10k.zsh ~/.p10k.zsh
    copy_src2dst .zprofile ~/.zprofile

    source ../03-zsh-directory/offline_install_zsh_ohmyzsh.sh 0
    export_zsh_to_bashrc
else
    # 检查参数值
    if [ "$1" -eq 0 ]; then
        echo "参数值为0"

    else
        echo "参数值不为0"
    fi
fi


