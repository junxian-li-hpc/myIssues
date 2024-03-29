set guifont=Ubuntu\ Mono\ Regular\ 20 " Ubuntu下设置gvim字体
" 参考：<a href='https://blog.csdn.net/gujing001/article/details/7074583'>Gvim 字体大小设置_gvim字体大小-CSDN博客</a>
setlocal noswapfile " 不要生成swap文件
set bufhidden=hide " 当buffer被丢弃的时候隐藏它
colorscheme evening " 设定配色方案

set number " 显示行号 或者 set nu
set relativenumber  "显示相对行号 或者 set rnu
" 取消行号 set nonumber 或者 set nonu
" 取消相对行号 set norelativenumber 或者 set nornu

set cursorline " 突出显示当前行
set ruler " 打开状态栏标尺

set shiftwidth=2 " 设定 << 和 >> 命令移动时的宽度为 2
set softtabstop=2 " 使得按退格键时可以一次删掉 2 个空格
set tabstop=2 " 设定 tab 长度为 2

set nobackup " 覆盖文件时不备份
set autochdir " 自动切换当前目录为当前文件所在的目录
set backupcopy=yes " 设置备份时的行为为覆盖

set hlsearch " 搜索时高亮显示被找到的文本
set incsearch " 输入搜索内容时就显示搜索结果
set ignorecase " 搜索时忽略大小写
set smartcase " 搜索时如果有一个以上的大写字母，就切换到区分大小写


set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
set t_vb= " 置空错误铃声的终端代码
set matchtime=2 " 短暂跳转到匹配括号的时间
set magic " 设置魔术
set smartindent " 开启新行时使用智能自动缩进
set backspace=indent,eol,start " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1 " 设定命令行的行数为 1
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ Ln\ %l,\ Col\ %c/%L%) " 设置在状态行显示的信息
set foldenable " 开始折叠
set foldmethod=syntax " 设置语法折叠
set foldcolumn=0 " 设置折叠区域的宽度
setlocal foldlevel=1 " 设置折叠层数为 1
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> " 用空格键来开关折叠

set clipboard=unnamed " 同步剪切板和匿名寄存器，别老烦我，这么多剪切板<a href='https://harttle.land/2020/09/04/vim-clipboard.html'>Vim 使用系统剪切板 | Harttle Land</a>
vnoremap <C-y> "+y   "支持在Visual模式下，通过C-y复制到系统剪切板
nnoremap <C-p> "*p   "支持在normal模式下，通过C-p粘贴系统剪切板

