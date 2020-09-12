:set nocompatible              " be iMproved, required
:filetype off                  " required

:filetype plugin on
:set omnifunc=syntaxcomplete#Complete

:colorscheme material

" Markdown Spell Check
:autocmd BufRead,BufNewFile *.md setlocal spell
:autocmd BufRead,BufNewFile *.md set complete+=kspell
" Tex Spell Check
:autocmd BufRead,BufNewFile *.tex setlocal spell
:autocmd BufRead,BufNewFile *.tex set complete+=kspell

" Competitive programming
map <F5> :<C-U>!g++-9 -O2 --std=c++17 %:r.cc -o %:r.out && ./%:r.out<CR>
map <F7> :<C-U>!g++-9 -g --std=c++17 %:r.cc -o %:r.out && lldb ./%:r.out<CR>

" Trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

:syntax on
:let java_highlight_all=1
:let java_highlight_functions=1

:set nu!
:set ruler
:set tabstop=2
:set colorcolumn=80
:set mouse=a
:set cindent
:set autoindent
:set shiftwidth=2
:set expandtab
:set incsearch
