" ========== general settings
syntax on
set nu
set ts=4
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent
set cindent
set cursorline
highlight VertSplit ctermbg=234 ctermfg=234
set noeb vb t_vb=


" ========== Vundle
" set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" ========== YCM
set completeopt=longest,menu
" VimTip1228
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" Close completion form when press Enter
let g:ycm_key_list_stop_completion = ['<CR>']

highlight SpellBad term=reverse ctermbg=170 gui=undercurl guisp=Red
" let g:ycm_key_list_select_completion=['<c-n>']
" let g:ycm_key_list_select_completion = ['<Down>']
" let g:ycm_key_list_previous_completion=['<c-p>']
" let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0                   " 关闭加载.ycm_extra_conf.py提示
let g:ycm_collect_identifiers_from_tags_files=1  " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2      " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0                       " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1         " 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
" force recomile with syntastic
" nnoremap <leader>lo :lopen<CR> "open locationlist
" nnoremap <leader>lc :lclose<CR>    "close locationlist
inoremap <leader><leader> <C-x><C-o>

" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

" 跳转到定义处
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>


" ========== airline
let g:airline#extensions#tabline#enabled = 1
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
nnoremap [u :bp\|bd #<CR>


" ========== NERDTree and Tagbar
" NerdTree####################################################
" 去除第一行的帮助提示
let NERDTreeMinimalUI=1
" 在左边占多宽
let NERDTreeWinSize=28
" 不高亮显示光标所在的文件
let NERDTreeHighlightCursorline=0
" 当前目录的设定
let NERDTreeChDirMode = 1
" 自动退出
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
" 打开vim时自动打开
autocmd vimenter * NERDTree
" <F2>作为toggle
nmap <F2> :NERDTreeToggle<CR>
" 显示书签
" let NERDTreeShowBookmarks=1
" 设置忽略文件类型"
" let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']

" Tagbar######################################################
" 在这儿设定二者的分布
let g:tagbar_vertical = 22
" 去除第一行的帮助信息
let g:tagbar_compact = 1
" 当编辑代码时，在Tagbar自动追踪变量
let g:tagbar_autoshowtag = 1
" 个人爱好，展开关闭文件夹的图标
" let g:tagbar_iconchars = ['▸', '▾']
" <F3>作为toggle
nmap <F3> :TagbarToggle<CR>
" 打开vim时自动打开
autocmd VimEnter * nested :TagbarOpen
wincmd l
" 打开vim时光标置于文本编辑区
autocmd VimEnter * wincmd l

