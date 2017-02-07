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
set cursorline " 选中行高亮 
 
" 缩进
"----------------------------------------
set expandtab    " tab由空格表示
set tabstop=4    " tab=4空格 
set shiftwidth=4    " 缩进位宽=4个空格位
set softtabstop=4    " 回退可以删除缩进 
set shiftround    "Use multiple of shiftwidth when indenting with '<' and '>'
set autoindent    " 继承前一行的缩进方式，特别适用于多行注释
set ai    " 自动缩进

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
"set foldmethod=indent " 按照缩进折叠
set foldlevel=2    " 折叠级别
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

" 为不同的文件类型设置不同的空格数替换TAB
"autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set ai
"autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set sw=4
"autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set ts=4
"autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set sts=4
autocmd FileType javascript,html,css,xml set ai
autocmd FileType javascript,html,css,xml set sw=2
autocmd FileType javascript,html,css,xml set ts=2
autocmd FileType javascript,html,css,xml set sts=2

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
nmap wq <C-W>qw
nmap wr <C-W>>w
nmap wf <C-W><w
nmap wi <C-W>+w
nmap wd <C-W>-w
nmap wx <C-W>x

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

"进行版权声明的设置
"添加或更新头
map <leader>df :call AddTitle()<cr>
autocmd BufNewFile *.py :call AddTitle()
function AddTitle()
    call append(0,"#!/usr/bin/env python")
    call append(1,"#-*- coding: utf-8 -*-")
    call append(2,"# vim:fenc=utf-8")
    call append(3,"# @author tlwlmy")
    call append(4,"# @version ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(5,"")
endf

" Bundles（插件管理）
"----------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

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

" 自动补全
Bundle 'Valloric/YouCompleteMe'
"Bundle 'Shougo/neocomplete.vim'

" 显示git diff状态
Bundle "airblade/vim-gitgutter"

" git命令
Bundle "tpope/vim-fugitive"

" 文件查找插件
Bundle 'kien/ctrlp.vim'

" 函数模糊匹配查找
Bundle 'tacahiroy/ctrlp-funky'

" 状态栏插件
Bundle 'bling/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
"Bundle 'Lokaltog/vim-powerline'

" 字符串包围/改变或去除引号/括号或者HTML标签
Bundle 'tpope/vim-surround'

" 光标多行编辑 <C-n> <C-x> <C-p>
Bundle 'terryma/vim-multiple-cursors'

" 生成函数、变量列表，需要先装ctags
Bundle 'majutsushi/tagbar'

" 保存vim编辑信息，比如最后的位置
Bundle 'vim-scripts/restore_view.vim'

" 垂直缩进对齐线
Bundle 'nathanaelkane/vim-indent-guides'

" 快速编辑结对符
Bundle 'gcmt/wildfire.vim'

" 快速跳转
Bundle 'Lokaltog/vim-easymotion'

" todo list跳转
Bundle 'vim-scripts/TaskList.vim'

" 颜色配色方案
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'flazz/vim-colorschemes'

" python
"Bundle 'klen/python-mode'
Bundle 'yssource/python.vim'
Bundle 'hdima/python-syntax'
Bundle 'hynek/vim-python-pep8-indent'
" python补全插件
Bundle 'davidhalter/jedi-vim'
Bundle 'python_match.vim'
Bundle 'pythoncomplete'
Bundle 'tlwlmy/pyfold'
"Bundle 'vim-scripts/pep8'
"Bundle 'nvie/vim-flake8'
"Bundle 'kevinw/pyflakes-vim'
"Bundle 'vim-scripts/python_fold'
"Bundle 'tmhedberg/SimpylFold'

" PHP代码折叠神器，不卡，比内置的折叠好很多
"Bundle 'rayburgemeestre/phpfolding.vim'

" js
Bundle 'elzr/vim-json'
Bundle 'groenewege/vim-less'
Bundle 'pangloss/vim-javascript'
Bundle 'briancollins/vim-jst'
Bundle 'kchmck/vim-coffee-script'

" html
Bundle 'tlwlmy/HTML-AutoCloseTag'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'gorodinskiy/vim-coloresque'
Bundle 'tpope/vim-haml'
Bundle 'mattn/emmet-vim'

filetype on
call vundle#end()            " required
filetype plugin indent on    " required

" vue
" Bundle 'posva/vim-vue'
au BufRead,BufNewFile *.vue set ft=html

" UI
set background=dark
set t_Co=256 
if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
    "let g:solarized_termcolors=256 ubuntu termitor set
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
endif

"colorscheme distinguished
"colorscheme vividchalk
"colorscheme molokai
colorscheme solarized


" 插件配置

" NerdTree {
    if isdirectory(expand("~/.vim/bundle/nerdtree"))
        map <C-e> :NERDTreeToggle<CR>
        map <leader>e :NERDTreeFind<CR>
        nmap <leader>nt :NERDTreeFind<CR>
    endif
" }

" Indent Guides 缩进列对齐线 {
    if isdirectory(expand("~/.vim/bundle/vim-indent-guides"))
        let g:indent_guides_start_level = 2
        let g:indent_guides_guide_size = 1
        let g:indent_guides_enable_on_vim_startup = 1
    endif
" }

" ctrlp-funky
    if isdirectory(expand("~/.vim/bundle/ctrlp-funky"))
        nnoremap <Leader>fu :CtrlPFunky<Cr>
        " narrow the list down with a word under cursor
        nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
    endif
" }

" Ctags {
    set tags=./tags;/,~/.vimtags

    " Make tags placed in .git/tags file available in all levels of a repository
    let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
    if gitroot != ''
        let &tags = &tags . ',' . gitroot . '/.git/tags'
    endif

    nmap <C-i> :TagbarToggle<CR>
" }

" vim-airline {
    if isdirectory(expand("~/.vim/bundle/vim-airline"))
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

" tpope/vim-fugitive {
    nmap gj <Plug>GitGutterNextHunk
    nmap gk <Plug>GitGutterPrevHunk
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

" syntastic {
    if isdirectory(expand("~/.vim/bundle/syntastic"))
        " 设置每次w保存后语法检查
        function! ToggleErrors()
            Errors
        endfunction
        "set statusline+=%#warningmsg#
        "set statusline+=%{SyntasticStatuslineFlag()}
        "set statusline+=%*

        let g:syntastic_check_on_open=1
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_wq = 0
        let syntastic_loc_list_height = 5
        let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
        autocmd WinEnter * if &buftype ==#'quickfix' && winnr('$') == 1 | quit |endif
        autocmd WinLeave * lclose
    endif
" }


" PyMode {
    let python_highlight_all = 1
    " Disable if python support not present
    if !has('python') && !has('python3')
        let g:pymode = 0
    endif

    if isdirectory(expand("~/.vim/bundle/python-mode"))
        let g:pymode_lint_checkers = ['pyflakes']
        let g:pymode_trim_whitespaces = 0
        let g:pymode_options = 0
        let g:pymode_rope = 0
    endif

    let g:syntastic_python_checkers = ['flake8']
    "let g:syntastic_python_flake8_exec = 'flake8-python2'
    let g:syntastic_python_flake8_args='--ignore=E501,E225,F405,E401,E302'

    "let g:flake8_show_quickfix=0
    "autocmd BufWritePost *.py call Flake8()
" }

" php {
    " Turn on PHP fast folds
    let g:DisableAutoPHPFolding = 0
" }

" YouCompleteMe {
    if isdirectory(expand("~/.vim/bundle/YouCompleteMe"))
        "设置error和warning的提示符，如果没有设置，ycm会以syntastic的  
        " g:syntastic_warning_symbol 和 g:syntastic_error_symbol 这两个为准  
        let g:ycm_error_symbol='>>'  
        let g:ycm_warning_symbol='>*' 

        let g:acp_enableAtStartup = 0

        " remap Ultisnips for compatibility for YCM
        let g:UltiSnipsExpandTrigger = '<C-j>'
        let g:UltiSnipsJumpForwardTrigger = '<C-j>'
        let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

        "允许在字符串里补全（双引号）
        let g:ycm_complete_in_strings = 1
        "开启基于tag的补全，可以在这之后添加需要的标签路径  
        let g:ycm_collect_identifiers_from_tags_files = 1  
        "开启语义补全  
        let g:ycm_seed_identifiers_with_syntax = 1  
        "在接受补全后不分裂出一个窗口显示接受的项  
        set completeopt-=preview  
        "不显示开启vim时检查ycm_extra_conf文件的信息  
        let g:ycm_confirm_extra_conf=0  
        "每次重新生成匹配项，禁止缓存匹配项  
        let g:ycm_cache_omnifunc=0  
        "在注释中也可以补全  
        let g:ycm_complete_in_comments=1  
        "输入第一个字符就开始补全  
        let g:ycm_min_num_of_chars_for_completion=1 
        "在注释输入中也能补全
        let g:ycm_complete_in_comments = 1
        "在字符串输入中也能补全
        let g:ycm_complete_in_strings = 1
        "注释和字符串中的文字也会被收入补全
        let g:ycm_collect_identifiers_from_comments_and_strings = 1

        nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
        "nnoremap <leader>lo :lopen<CR>	"open locationlist
        "nnoremap <leader>lc :lclose<CR>	"close locationlist
        inoremap <leader><leader> <C-x><C-o>

        " Enable omni completion.
        autocmd Filetype * if &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
        autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

    endif
" }
