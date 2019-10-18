map <F9> :call SaveInputData()<CR>
func SaveInputData()
    exec "tabnew"
    exec 'normal "+gP'
    exec "w! /tmp/input_data"
endfunc

source $VIMRUNTIME/vimrc_example.vim

if has('mouse')
    set mouse=a
endif


" 定义快捷键的前缀，即 <Leader>
let mapleader=";"

" 设置鼠标模式快捷键
nmap <Leader>c :set mouse=c<CR>
nmap <Leader>a :set mouse=a<CR>

" 设置paste
"namap <F9> :set paste<CR>
nmap <F10> :set nopaste<CR>

" 定义快捷键到行首和行尾
nmap <Leader>lb 0
nmap <Leader>le $

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至vim
nmap <Leader>p "+p

" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>

" 设置快捷键遍历子窗口
" 依次遍历
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j

" 定义快捷键在结对符之间跳转，助记 pair
nmap <Leader>pa %

" 让配置变更立即生效
"autocmd BufWritePost $MYVIMRC source $MYVIMRC
autocmd BufWritePost *.py call Flake8()
""实用设置
" 设置当文件被改动时自动载入
set autoread
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全
set completeopt=preview,menu
"允许插件
filetype plugin on
"共享剪贴板
set clipboard+=unnamed
"自动保存
let g:auto_save = 0
let g:auto_save_events = ["InsertLeave", "TextChanged", "TextChangedI", "CursorHoldI", "CompleteDone"]
augroup ft_markdown
    au!
    au FileType markdown let b:auto_save = 1
augroup END

"au CursorHoldI * call AutoSave()
"make 运行
set makeprg=g++\ -Wall\ \ %
"自动保存
au FocusLost * silent! wa
set autowriteall
set ruler                   " 打开状态栏标尺
"set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions+=m           " 隐藏菜单栏
" 设置在状态行显示的信息
set foldcolumn=0
set foldmethod=indent
set foldlevel=3
set foldenable              " 开始折叠
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 语法高亮
set syntax=on
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
"set noexpandtab
" 用空格代替制表符
set expandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
" 历史记录数
set history=1000
"禁止生成临时文件
set nobackup
set noswapfile
"搜索忽略大小写
set ignorecase
" 开启实时搜索功能
set incsearch
" 高亮显示搜索结果
set hlsearch
"禁止vim生成 un~文件
set noundofile

" 关闭兼容模式
set nocompatible

" backspace 设置
set backspace=indent,eol,start

" vim 自身命令行模式智能补全
set wildmenu
set mousemodel=popup

" 禁止换行自动注释
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

au FileType php setlocal dict+=~/.vim/dict/php_funclist.dict
au FileType css setlocal dict+=~/.vim/dict/css.dict
au FileType c setlocal dict+=~/.vim/dict/c.dict
au FileType cpp setlocal dict+=~/.vim/dict/cpp.dict
au FileType scale setlocal dict+=~/.vim/dict/scale.dict
au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/css.dict


"syntastic相关
execute pathogen#infect()
let g:syntastic_python_checkers=['pylint']
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
"golang
"Processing... % (ctrl+c to stop)
let g:fencview_autodetect=0
set rtp+=$GOROOT/misc/vim

" 显示相关
set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示
"winpos 5 5          " 设定窗口位置
"set lines=40 columns=155    " 设定窗口大小
set go=             " 不要图形按钮
"color asmanian2     " 设置背景主题
"set guifont=Courier_New:h10:cANSI   " 设置字体
syntax on           " 语法高亮
"autocmd InsertLeave * se nocul  " 用浅色高亮当前行
"autocmd InsertEnter * se cul    " 用浅色高亮当前行
set ruler           " 显示标尺
set showcmd         " 输入的命令显示出来，看的清楚些
set cmdheight=1     " 命令行（在状态行下）的高度，设置为1
"set whichwrap+=<,>,h,l   " 允许backspace和光标键跨越行边界(不建议)
"set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离
set novisualbell    " 不要闪烁(不明白)
set laststatus=1    " 启动显示状态行(1),总是显示状态行(2)
set foldenable      " 允许折叠
set foldmethod=manual   " 手动折叠
"set background=dark "背景使用黑色
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
" 显示中文帮助
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif
" 设置配色方案
set nu
colorscheme desert
"字体
"if (has("gui_running"))
"   set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
"endif

"markdown配置
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd
au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript
"markdown to HTML
nmap md :!~/.vim/markdown.pl % > %.html <CR><CR>
nmap fi :!firefox %.html & <CR><CR>
nmap \ \cc
vmap \ \cc

"将tab替换为空格
nmap tt :%s/\t/    /g<CR>

"""""新文件标题
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."), "")
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python3")
        call append(line("."),"# -*- coding:utf-8 -*-")
        call append(line(".")+1, "")
        call append(line(".")+2, "'''")
        call append(line(".")+3, "Author: jack.chen")
        call append(line(".")+4, "Mail: 1259195793@qq.com")
        call append(line(".")+5, "Created Time: ".strftime("%c"))
        call append(line(".")+6, "'''")
        call append(line(".")+7, "")
        call append(line(".")+8, "")
        call append(line(".")+9, "")
    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
        call append(line(".")+1, "")

    elseif &filetype == 'mkd'
        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "  > Author: ")
        call append(line(".")+2, "  > Mail: ")
        call append(line(".")+3, "  > Created Time: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+8, "#endif")
    endif
    if &filetype == 'java'
        call append(line(".")+6,"public class ".expand("%:r"))
        call append(line(".")+7,"")
    endif
    "新建文件后，自动定位到文件末尾
endfunc
autocmd BufNewFile * normal G

"键盘命令

:nmap <silent> <F9> <ESC>:Tlist<RETURN>
" shift tab pages
map <S-Left> :tabp<CR>
map <S-Right> :tabn<CR>
map! <C-Z> <Esc>zzi
map! <C-O> <C-Y>,
map <C-A> ggVG$"+y
map <F12> gg=G
map <C-w> <C-w>w
imap <C-k> <C-y>,
imap <C-t> <C-q><TAB>
imap <C-j> <ESC>
" 全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>
" 启动 vim 时自动全屏
"autocmd VimEnter * call ToggleFullscreen()

"set clipboard=unnamed
"快捷键"\+1"
nnoremap <leader>1 :set filetype=xhtml<CR>
nnoremap <leader>2 :set filetype=css<CR>
nnoremap <leader>3 :set filetype=javascript<CR>
nnoremap <leader>4 :set filetype=php<CR>
"去空行
nnoremap <F2> :g/^\s*$/d<CR>
"比较文件
nnoremap <C-F2> :vert diffsplit
"nnoremap <Leader>fu :CtrlPFunky<Cr>
"nnoremap <C-n> :CtrlPFunky<Cr>
"折叠
set fdm=indent
"列出当前目录文件
map <F3> :NERDTreeToggle<CR>
"imap <F3> <ESC> :NERDTreeToggle<CR>
"打开树状文件目录
map <C-F3> \be
:autocmd BufRead,BufNewFile *.dot map <F5> :w<CR>:!dot -Tjpg -o %<.jpg % && eog %<.jpg  <CR><CR> && exec "redr!"
"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python3 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc
"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc

"代码格式优化化

map <F6> :call FormartSrc()<CR><CR>

"定义FormartSrc()
func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive --ignore=E402,E501 %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc
"结束定义FormartSrc

"配置vim-autoformat插件
"F6自动格式化代码
"noremap <F6> :Autoformat<CR>
"let g:autoformat_verbosemode=1
"保存时自动格式化代码，针对所有支持的文件
au BufWrite * :Autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
"autocmd FileType vim,tex let b:autoformat_autoindent=0
"保存时自动格式化PHP代码
"au BufWrite *.php :Autoformat
let g:formatdef_my_html = '"html-beautify -s 4"'
let g:formatters_html = ['my_html']

" 对 HTML 元素进行转义：< -> &lt;、> -> &gt;、& -> &amp;、空格 -> &nbsp;、行尾添加 <br />
" 先后顺序敏感
function HtmlEscape()
    retab<CR>
    silent s/&/\&amp;/eg
    silent s/</\&lt;/eg
    silent s/>/\&gt;/eg
    silent s/ /\&nbsp;/eg
    silent s/$/<br \/>/eg
endfunction
vnoremap <Leader>he :call HtmlEscape()<CR>

"行内替换
set gdefault
"编码设置
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8,gb2312,ucs-bom,euc-cn,euc-tw,gb18030,gbk,cp936
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 总是显示状态行
set laststatus=2
" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=1
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
"设定折叠
set fdm=marker
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 为C程序提供自动缩进
set smartindent
" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile *  setfiletype txt
"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" CTags的设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Sort_Type = "name"    " 按照名称排序
let Tlist_Use_Right_Window = 1  " 在右侧显示窗口
let Tlist_Compart_Format = 1    " 压缩方式
let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer
""let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags
""let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树
"let Tlist_Show_One_File=1            "不同时显示多个文件的tag，只显示当前文件的
"设置tags
set tags=tags;
set autochdir

"默认打开Taglist
let Tlist_Auto_Open=0
""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口
" minibufexpl插件的一般设置
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
nmap tl :Tlist<cr>
let g:indentLine_char = '┊'
set iskeyword+=.
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType yaml setlocal ai ts=2 sw=2 et

"set nocompatible               " be iMproved
"filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required!

Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'Auto-Pairs'
Plugin 'python-imports.vim'
Plugin 'CaptureClipboard'
Plugin 'ctrlp-modified.vim'
Plugin 'last_edit_marker.vim'
Plugin 'synmark.vim'
Plugin 'SQLComplete.vim'
Plugin 'Javascript-OmniCompletion-with-YUI-and-j'
Plugin 'JavaScript-Indent'
Plugin 'Better-Javascript-Indentation'
Plugin 'jslint.vim'
"Plugin "pangloss/vim-javascript"
Plugin 'Vim-Script-Updater'
Plugin 'ctrlp.vim'
Plugin 'jsbeautify'
Plugin 'The-NERD-Commenter'
Plugin 'django_templates.vim'
Plugin 'Django-Projects'
Plugin 'xml.vim'
"Plugin 'Valloric/YouCompleteMe'

call plug#begin('~/.vim/bundle')
Plug 'gmarik/vundle'
Plug 'tpope/vim-fugitive'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'Yggdroot/indentLine'
Plug 'tacahiroy/ctrlp-funky'
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/wincent/command-t.git'
Plug 'https://github.com/Yggdroot/indentLine.git'
Plug 'https://github.com/mattn/emmet-vim.git'
Plug 'https://github.com/vim-syntastic/syntastic.git'
Plug 'https://github.com/othree/javascript-libraries-syntax.vim.git'
Plug 'https://github.com/othree/tern_for_vim_coffee.git'
Plug 'https://github.com/vim-scripts/JavaScript-Indent.git'
Plug 'sillybun/autoformatpythonstatement', {'do': './install.sh'}
Plug 'Chiel92/vim-autoformat'
Plug 'Valloric/YouCompleteMe'
Plug 'davidhalter/jedi-vim'
Plug 'VundleVim/Vundle.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'vim-scripts/phd'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'derekwyatt/vim-fswitch'
Plug 'vim-scripts/a.vim'
Plug 'kshenoy/vim-signature'
Plug 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/indexer.tar.gz'
Plug 'vim-scripts/DfrankUtil'
Plug 'vim-scripts/vimprj'
Plug 'dyng/ctrlsf.vim'
Plug 'vim-scripts/DrawIt'
Plug 'SirVer/ultisnips'
Plug 'derekwyatt/vim-protodef'
Plug 'gcmt/wildfire.vim'
Plug 'sjl/gundo.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'suan/vim-instant-markdown'
Plug 'qpkorr/vim-bufkill'
Plug 'skywind3000/asyncrun.vim'
"Plug 'kannokanno/previm'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
"Plug 'tamlok/vim-markdown'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'tell-k/vim-autopep8'
"Plug 'tyru/open-browser.vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'TimothyYe/vim-ydict'
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'junegunn/vader.vim',  { 'on': 'Vader', 'for': 'vader' }
Plug 'kovisoft/paredit', { 'for': ['clojure', 'scheme'] }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'vim-scripts/indentpython.vim'
"Plug 'maralla/completor.vim'
"Plug 'maralla/completor-neosnippet'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'dense-analysis/ale'

" 补全设置 {{{
"使用tab补全
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
" }}}

"注释
" 注释说明 {{{
"<leader>cc   加注释
"<leader>cu   解开注释
"<leader>c<space>  加上/解开注释, 智能判断
"<leader>cy   先复制, 再注解(p可以进行黏贴)
" 注释的时候自动加个空格, 强迫症必配
"let g:NERDSpaceDelims=1
" }}}

let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

"ctrlp设置
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.pyc,*.png,*.jpg,*.gif  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v\.(exe|so|dll)$'
let g:ctrlp_extensions = ['funky']
"let NERDTreeIgnore=['\.pyc']

"NERDtee设定
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt'
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=31
nnoremap f :NERDTreeToggle
map <F3> :NERDTreeToggle<CR>

let $LANG = 'zh_CN.UTF-8'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" 寻找全局配置文件
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
" 禁用syntastic来对python检查
let g:syntastic_ignore_files=[".*\.py$"]
" 使用ctags生成的tags文件
let g:ycm_collect_identifiers_from_tag_files = 1
" 开启语义补全
" 修改对C语言的补全快捷键，默认是CTRL+space，修改为ALT+;未测出效果
"let g:ycm_key_invoke_completion = '<M-;>'
" 设置转到定义处的快捷键为ALT+G，未测出效果
"nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>
"关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
" 在接受补全后不分裂出一个窗口显示接受的项
set completeopt-=preview
" 让补全行为与一般的IDE一致
set completeopt=longest,menu
" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf=0
" 每次重新生成匹配项，禁止缓存匹配项
let g:ycm_cache_omnifunc=0
"在注释中也可以补全
let g:ycm_complete_in_comments=1
" 输入第一个字符就开始补全
let g:ycm_min_num_of_chars_for_completion=1
" 错误标识符
let g:ycm_error_symbol='>>'
"警告标识符
let g:ycm_warning_symbol='>*'
" 不查询ultisnips提供的代码模板补全，如果需要，设置成1即可
let g:ycm_use_ultisnips_completer=1
"把补全背景色换成当前vim的背景色
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#000000 guibg=#111100
map <F7> :YcmCompleter GoTo<CR>

"ale
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = '✗'
let g:ale_echo_msg_warning_str = '⚡'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
let g:ale_linters = {
  \   'csh': ['shell'],
  \   'go': ['gofmt', 'golint', 'go vet'],
  \   'help': [],
  \   'perl': ['perlcritic'],
  \   'python': ['flake8', 'mypy', 'pylint'],
  \   'rust': ['cargo'],
  \   'spec': [],
  \   'text': [],
  \   'zsh': ['shell'], 
  \   'reStructuredText': ['rstcheck'], 
  \   'javascript': ['eslint'],
  \   'c++': ['clang'],
  \   'c': ['clang'],
\}
let g:ale_fixers = {'python': ['remove_trailing_lines', 'trim_whitespace', 'autopep8']}
let g:ale_java_javac_options = '-encoding UTF-8  -J-Duser.language=en'

"tagbar设置
"设置tagbar使用的ctags的插件,必须要设置对

let g:tagbar_ctags_bin='/usr/bin/ctags'

"设置tagbar的窗口宽度
let g:tagbar_width=20

"设置tagbar的窗口显示的位置,为左边
let g:tagbar_right_=1

"打开文件自动 打开
autocmd BufReadPost *.py,*.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

"映射tagbar的快捷键
map <F4> :TagbarToggle<CR>

" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {}
    \ }

" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

nmap <F8> <Plug>MarkdownPreview
nmap <C-F8> <Plug>MarkdownPreviewStop
nmap <S-F8> <Plug>MarkdownPreviewToggle

"vim-ydict 设置
"按Ctrl+t查询所选单词：
vnoremap <silent> <C-f> :<C-u>Ydv<CR>
"使用<leader>+yc查询当前光标位置的单词：
nnoremap <leader>yc :<C-u>Ydc<CR>
"使用<leader>+yd输入要查
noremap <leader>yd :<C-u>Yde<CR>

