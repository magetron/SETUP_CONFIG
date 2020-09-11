:set nocompatible              " be iMproved, required
:filetype off                  " required

:filetype plugin on
:set omnifunc=syntaxcomplete#Complete

" Markdown Spell Check
:autocmd BufRead,BufNewFile *.md setlocal spell
:autocmd BufRead,BufNewFile *.md set complete+=kspell
" Tex Spell Check
:autocmd BufRead,BufNewFile *.tex setlocal spell
:autocmd BufRead,BufNewFile *.tex set complete+=kspell

" Competitive programming
map <F5> :<C-U>!g++-9 -O2 --std=c++17 %:r.cc -o %:r.out && ./%:r.out<CR>
map <F7> :<C-U>!g++-9 -g --std=c++17 %:r.cc -o %:r.out && lldb ./%:r.out<CR>

:syntax on
:let java_highlight_all=1
:let java_highlight_functions=1

:set termguicolors

:set nu!
:set ruler
:set tabstop=2
:set colorcolumn=80
:set mouse=a
:set autoindent
:set shiftwidth=2
:set expandtab
:set incsearch
