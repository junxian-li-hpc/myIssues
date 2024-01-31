## 用法
```bash
#cd 到本目录 cd myissues/ubuntu-essentials

cd 01-configs-backup && chmod +x install.sh && ./install.sh
#输入密码 如果没有sudo权限，这个就不要执行了，但是要 cd 01-configs-backup

chmod +x copy.sh && ./copy.sh

```

安装 `zsh`
```bash
#cd 到本目录 cd myissues/ubuntu-essentials

cd 03-zsh-directory && chmod +x offline_install_zsh_ohmyzsh.sh && ./offline_install_zsh_ohmyzsh.sh

# 应该会自动进入zsh，记得先 exit 退出一下
```

## 实战记录
### 2024-01-31 Wed
在 tianjin 某服务器上，我用了这个脚本

安装完之后 tmux 无法打开了，我搜一下，是因为zsh在这个服务器上装过了，.tmux.conf里 zsh的路径还是写的 ~/Applications/zsh/bin/zsh，但是这个路径在这个服务器上不存在，所以tmux打不开了，我把这个路径改成了 /usr/bin/zsh，就可以了
(copilot 真聪明
所以 offline_install_zsh_ohmyzsh.sh 里面最好改一下，如果已经安装了zsh，就不要再在.bashrc里面添加了，不然会出现上面的问题，还有就是.tmux.conf里面的zsh路径也要改一下，不然tmux打不开了