
let g:iswindows = 0
let g:islinux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
	set shell=powershell
	set shellcmdflag=-command
	" 设置默认终端，不然会使用cmd
	let g:iswindows = 1
else
	set encoding=utf-8
	" 编码设置
	let g:islinux = 1
endif
" 首先进行平台判断

if has("gui_running")
	set guifont=Source\ Code\ Pro:h16
endif
" gui判断

" Configuration file for vim
set modelines=0" CVE-2007-2438

" let &t_SI.="\e[5 q" "SI = INSERT mode
" let &t_SR.="\e[4 q" "SR = REPLACE mode
" let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
" 正确设置光标，使用 vim 的话取消注释这三行

syntax on
" 语法高亮

autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul
" 用浅色高亮当前行

set smartindent
" 智能对齐

set autoindent
" 自动对齐

set confirm
" 在处理未保存或只读文件的时候，弹出确认

set tabstop=4
" Tab键的宽度

set softtabstop=4
set shiftwidth=4
"  统一缩进为 2

set noexpandtab
" 不要用空格代替制表符

set number
" 显示行号

set history=50
" 历史纪录数

set hlsearch
set incsearch
" 搜索逐字符高亮

set gdefault
" 行内替换

set langmenu=zn_CN.UTF-8
set helplang=cn
" 语言设置

set cmdheight=2
" 命令行（在状态行）的高度，默认为1,这里是2

set ruler
" 在编辑过程中，在右下角显示光标位置的状态行

set laststatus=2
" 总是显示状态行

set showcmd
" 在状态行显示目前所执行的命令，未完成的指令片段亦会显示出来

set scrolloff=3
" 光标移动到buffer的顶部和底部时保持3行距离

set showmatch
" 高亮显示对应的括号

set matchtime=5
" 对应括号高亮的时间（单位是十分之一秒）

set autowrite
" 在切换buffer时自动保存当前文件

set wildmenu
" 增强模式中的命令行自动完成操作

set linespace=2
" 字符间插入的像素行数目

set whichwrap=b,s,<,>,[,]
" 开启Normal或Visual模式下Backspace键，空格键，左方向键，右方向键，Insert或replace模式下左方向键，右方向键跳行的功能。

if executable('clipboard-provider')
	let g:clipboard = {
				\ 'name': 'myClipboard',
				\     'copy': {
				\         '+': 'clipboard-provider copy',
				\         '*': 'clipboard-provider copy',
				\     },
				\     'paste': {
				\         '+': 'clipboard-provider paste',
				\         '*': 'clipboard-provider paste',
				\     },
				\ }
endif
" 使用系统剪切板

filetype plugin indent on
" 分为三部分命令：file on, file plugin on, file indent on.分别表示自动识别文件类型，用文件类型脚本，使用缩进定义文件。

