set nocompatible              " required
set foldmethod=indent
set foldlevel=99
set mouse=a
set encoding=utf-8
set clipboard=unnamed
set showmatch
set nu
syntax on
set backspace=indent,eol,start


" add man in vim cmd Man
runtime! ftplugin/man.vim

"color line 80
hi ColorColumn ctermbg=4

" add command execute in visual
" Pyhton F5 execute script, F6 execute script > result_py
nmap <F5> <Esc>:w<CR>:! python3.8 %<CR> 
nmap <F6> <Esc>:w<CR>:call Python_compile()<CR><CR>
nmap <F2> <Esc>:w<CR>:call MakeFile()<CR><CR>
nmap <F3> <Esc>:w<CR>:call C_compile()<CR><CR><CR> 

" Autocompleted python 
autocmd FileType python inoremap { {}<Left>
autocmd FileType python inoremap ( ()<Left>
autocmd FileType python inoremap " ""<Left>
autocmd FileType python inoremap ' ''<Left>
autocmd FileType python inoremap : :<CR>
autocmd FileType python inoremap [ []<Left>

" autocompleted c
"setting lgne column 80
autocmd FileType c set colorcolumn=80
" auto completion 
autocmd FileType c inoremap { {<CR>}<C-o>O<Tab>
autocmd FileType c inoremap ( ()<Left>
autocmd FileType c inoremap " ""<Left>
autocmd FileType c inoremap ' ''<Left>
autocmd FileType c inoremap : :<CR>
autocmd FileType c inoremap ; ;<CR>
autocmd FileType c inoremap [ []<Left>

" auto complede ifndef when *.h it's create
autocmd BufNewFile *.h  :call CheckHFile()

function! CheckHFile()
   let filename = expand("%:r")
   " change the number line at 13 getline:
   if (getline("1") !~ '#ifndef _'.filename)
      exe "normal!ggO#ifndef          _".filename
      exe "normal!A_"
      exe "normal!b"
      exe "normal!vg$gU"
      exe "normal!ggo# define         _".filename
      exe "normal!A_"
      exe "normal!b"
      exe "normal!vg$gU$"
      exe "normal!A\n\n\n"
      exe "normal!o#endif"
   endif
endfunction

nnoremap <space> za

"fonction clear C file
function! Clear_C()
    execute "! rm -f Makefile"
    execute "! rm -f result_c"
    execute "! rm -f *.out"
endfunction

"fonction Compilation pyhton > result_py
function! Python_compile()
    let g:dir=getcwd()
    let g:file=@%
    execute "! /Users/waxcoin/script_vim/./python_script.sh ". g:file " " . g:dir
    execute ":make"
endfunction

"fonction Compilation c > result_py
function! C_compile()
    execute ":make all"
    if filereadable('main.out')
        execute "! ./main.out > result_c"
    endif
endfunction

"fonction copy MakeFile to currently dir
function! MakeFile()
    let g:dir=getcwd()
    execute "! cp /Users/waxcoin/script_vim/Makefile ". g:dir
endfunction

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

let cwd=getcwd()
let python_highlight_all=1
let g:SimpylFold_docstring_preview=1

" create key 
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"call vundle#begin('~/some/path/here')
call vundle#begin()

filetype plugin indent on    " required

"PEP8
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'jnurmine/Zenburn'
Plugin 'mattn/emmet-vim'
Plugin 'alvan/vim-closetag'


" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
