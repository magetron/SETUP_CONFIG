:set nocompatible              " be iMproved, required
:filetype off                  " required

:filetype plugin on
:set omnifunc=syntaxcomplete#Complete

" set the runtime path to include Vundle and initialize
:set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'lervag/vimtex'

Plugin 'itchyny/lightline.vim'

" Plugin 'vim-airline/vim-airline'

" Plugin 'vim-airline/vim-airline-themes'

Plugin 'NLKNguyen/papercolor-theme'                                                         

" Plugin 'ycm-core/YouCompleteMe'

" Plugin 'dense-analysis/ale'

Plugin 'xuhdev/vim-latex-live-preview'

let g:livepreview_previewer = 'open -a Preview'

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

Plugin 'tpope/vim-fugitive'       

Plugin 'neovimhaskell/haskell-vim'

Plugin 'fatih/vim-go'
let g:go_null_module_warning = 0
let g:go_fmt_command = "gofmt"

Plugin 'justinmk/vim-syntax-extra'

Plugin '907th/vim-auto-save'
let g:auto_save = 1  " enable AutoSave on Vim startup

Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}

Plugin 'dhruvasagar/vim-table-mode'
let g:table_mode_corner = '|'

Plugin 'mhinz/vim-startify'
let g:startify_custom_header = [
  \ '                                ______      ',
  \ '            __                /\  ____`\    ',
  \ '   __   __ /\_\    ___ ___    \ \ \___\ \   ',
  \ '  /\ \ /\ \\/\ \ /` __` __`\   \ \  ____ \  ',
  \ '  \ \ \_/ / \ \ \/\ \/\ \/\ \   \ \ \___\ \ ',
  \ '   \ \___/   \ \_\ \_\ \_\ \_\   \ \_______\',
  \ '    \/__/     \/_/\/_/\/_/\/_/    \/_______/',
  \ '                                            ',
  \ '  ==========================================',
  \ '                                            ',
  \ ]
let g:ascii = [
  \ '                                            ',
  \ '============================================',
  \ '                                            ',
  \ 'Copyright Patrick Wu, 1999 - 2020           '
  \ ]
let g:startify_custom_footer = 'map(startify#fortune#boxed() + g:ascii, "\"   \".v:val")'
let g:startify_session_autoload = 1
let g:startify_change_to_dir = 1
let g:startify_fortune_use_unicode = 1
let g:ctrlp_reuse_window = 'startify'
let g:startify_list_order = ['bookmarks', 'files']
let g:startify_skiplist = [
  \ 'COMMIT_EDITMSG',
  \ $VIMRUNTIME .'/doc',
  \ 'bundle/.*/doc',
  \ '\.DS_Store'
  \ ]

"JFlex Vim Highlighting
augroup filetype
	au BufRead,BufNewFile *.flex,*.jflex	set filetype=jflex
augroup END
au Syntax jflex    so ~/.vim/syntax/jflex.vim

"Java CUP Vim Highlighting
autocmd BufNewFile,BufRead *.cup setf cup

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" git repos on your local machine (i.e. when working on your own plugin)
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.

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


" AutoLaunch NERDTree
:autocmd VimEnter * 
	\	if !argc() 
	\ |		Startify 
	\ |		NERDTree 
	\ |		wincmd w 
	\ | endif

" Ligtline configuration
:set laststatus=2
:let g:lightline = {
	\ 'colorscheme': 'material',
	\ }
:set noshowmode


" Airline Customistaion
"let g:airline_theme='material'
"let g:airline_powerline_fonts=1

" macOS Fix
:set backspace=indent,eol,start

" Markdown Spell Check
:autocmd BufRead,BufNewFile *.md setlocal spell
:autocmd BufRead,BufNewFile *.md set complete+=kspell

" Tex Spell Check
:autocmd BufRead,BufNewFile *.tex setlocal spell
:autocmd BufRead,BufNewFile *.tex set complete+=kspell

" Competitive programming
map <F5> :<C-U>!clang++ -O2 --std=c++17 %:r.cc -o %:r.out && ./%:r.out<CR>
map <F7> :<C-U>!clang++ -g --std=c++17 %:r.cc -o %:r.out && lldb ./%:r.out<CR>


" UTF-8 Support
:set fileencodings=utf-8,gbk,utf-16le,cp1252,iso-8859-15,ucs-bom
:set termencoding=utf-8
:set encoding=utf-8

:syntax on
:let java_highlight_all=1
:let java_highlight_functions=1

:set termguicolors
:set background=dark
:colorscheme material

:set nu!
:set ruler
:set tabstop=4

:set mouse=a
:set autoindent
:set shiftwidth=4
:set incsearch
