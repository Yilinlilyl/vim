" 基本配置
"----------------------------------------
filetype on    " 检测文件类型
filetype indent on    " 针对不同的文件类型采用不同的缩进格式
filetype plugin on    " 允许插件
filetype plugin indent on    " 允许插件

set nu    " 显示行号
set relativenumber number    " 相对行号，可用Ctrl+n在相对/绝对行号间切换
set backspace=indent,eol,start    " 退格键分别可删除缩进，上一行结束，insert之前的字
set showcmd    " 显示命令
set incsearch    " 开启实时搜索功能 
set ignorecase    " 搜索时大小写不敏感
syntax on    " 语法高亮
set nobackup    " 关闭备份
set noswapfile    " 禁止保存交换文件
set nocompatible    " 关闭兼容模式
set wildmenu    " 自身命令行模式智能补全
set history=100    " 历史记录数
set incsearch    " 搜索时自动匹配 
set hlsearch    " 高亮搜索项 
set undofile    " 缺省关闭，局部于缓冲
set ul=1000     " 可以撤销的最大改变次数
set viewoptions=cursor,folds,slash,unix    " viminfo 记录的内容
set virtualedit=onemore    " 光标可以移到当行最后一个字符之后 
set hidden    " 切换文件不保存，隐藏 
set showmatch    " 高亮显示匹配的括号
set clipboard=unnamed,unnamedplus    " 共享剪贴板
set nojoinspaces    " 用J合并两行用一个空格隔开
set report=0    " 通过使用: commands命令，告诉我们文件的哪一行被改变过 
set noerrorbells    " 不让vim发出讨厌的滴滴声 
set scrolloff=3    " 光标移动到buffer的顶部和底部时保持3行距离
 
" 缩进
"----------------------------------------
set expandtab    " tab由空格表示
set tabstop=4    " tab=4空格 
set shiftwidth=4    " 缩进位宽=4个空格位
set softtabstop=4    " 回退可以删除缩进 
set shiftround    "Use multiple of shiftwidth when indenting with '<' and '>'
set autoindent    " 继承前一行的缩进方式，特别适用于多行注释
set ai    " 自动缩进
set si    " 智能缩进

" 状态栏使用状态栏插件vim-airline
"----------------------------------------
" set ruler    " 右下角显示光标位置
" set showcmd    " 在状态栏显示正在输入的命令
" set showmode
" set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2    " 命令行（在状态行下）的高度，默认为1，这里是2

" 代码折叠  
"----------------------------------------
set foldenable    " 允许折叠
set foldmethod=syntax    " 按照语法折叠
set foldlevel=3    " 折叠级别
"set foldmarker={,}  
"set foldmethod=marker  
"set foldmethod=syntax  
"set foldlevel=100       " Don't autofold anything   
"set foldopen-=search   " don't open folds when you search into them  
"set foldopen-=undo     " don't open folds when you undo stuff  
"set foldcolumn=4  

"    编码设置
"----------------------------------------
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a      " 启动鼠标所有模式，但是右键功能不可用, 可以保证鼠标滚屏在当前屏幕内
set mousehide    " 输入文件时隐藏鼠标
" set selection=exclusive 和<gv冲突，最后一行不可以移动

" 恢复上次文件打开位置
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm'\"")|else|exe "norm $"|endif|endif

" 前导符号
"----------------------------------------
let mapleader = ','
let g:mapleader = ','

" 常用快捷键
"----------------------------------------

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" 分割窗口
map ws :split<cr>
map wv :vsplit<cr>
nmap wj <C-W>j
nmap wk <C-W>k
nmap wh <C-W>h
nmap wl <C-W>l

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" 全选
map <C-a> ggVG

" 相对/绝对行号转换
noremap <C-b> :call NumberToggle()<cr>
cnoremap <C-b> :call NumberToggle()<cr>

" 自定义的函数
"----------------------------------------
" 相对绝对行号转换
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc

" 快速滚屏
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>


" Bundles（插件管理）
"----------------------------------------
set nocompatible              " be iMproved, required
"filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" 文件索引树
Bundle "scrooloose/nerdtree"

" 语法检查
Bundle "scrooloose/syntastic"

" 括号自动匹配
" Bundle 'Townk/vim-autoclose'
Bundle 'jiangmiao/auto-pairs'

" 自动注释
Bundle 'scrooloose/nerdcommenter'

" 显示git diff状态
Bundle "airblade/vim-gitgutter"

" 文件查找插件
Bundle 'kien/ctrlp.vim'

" 状态栏插件
Bundle 'bling/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'Lokaltog/vim-powerline'

" 字符串包围/改变或去除引号/括号或者HTML标签
Bundle 'tpope/vim-surround'

" 光标多行编辑 <C-n> <C-x> <C-p>
Bundle 'terryma/vim-multiple-cursors'

Bundle 'Lokaltog/vim-distinguished'

" 生成函数、变量列表，需要先装ctags
Bundle 'majutsushi/tagbar'
nmap <C-i> :TagbarToggle<CR>

" 垂直缩进对齐线
Bundle 'nathanaelkane/vim-indent-guides'

" 快速编辑结对符
Bundle 'gcmt/wildfire.vim'

" 快速跳转
Bundle 'Lokaltog/vim-easymotion'

" python
Bundle 'hynek/vim-python-pep8-indent'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" 插件配置

" NerdTree {
if isdirectory(expand("~/.vim/bundle/nerdtree"))
    map <C-e> :NERDTreeToggle<CR>
    map <leader>e :NERDTreeFind<CR>
    nmap <leader>nt :NERDTreeFind<CR>
endif
" }

" vim-airline {
if isdirectory(expand("~/.vim/bundle/vim-airline/"))
    if !exists('g:airline_theme')
        let g:airline_theme = 'solarized'
    endif
    if !exists('g:airline_powerline_fonts')
        " Use the default set of separators with a few customizations
        let g:airline_left_sep='›'  " Slightly fancier than '>'
        let g:airline_right_sep='‹' " Slightly fancier than '<'
    endif
endif
" }


" Wildfire {
let g:wildfire_objects = {
            \ "*" : ["i'", 'i"', "i)", "i]", "i}", "ip"],
            \ "html,xml" : ["at"],
            \ }
" }

" vim-easymotion {
    let g:EasyMotion_smartcase = 1
    "let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
    map <Leader><leader>h <Plug>(easymotion-linebackward)
    map <Leader><Leader>j <Plug>(easymotion-j)
    map <Leader><Leader>k <Plug>(easymotion-k)
    map <Leader><leader>l <Plug>(easymotion-lineforward)
    " 重复上一次操作, 类似repeat插件, 很强大
    map <Leader><leader>. <Plug>(easymotion-repeat)
" }
