set nocompatible              " required
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set foldmethod=indent
set foldlevel=99
set encoding=utf-8
set clipboard=unnamed
set showmatch
set rnu
set nu
syntax enable
colo wax
set backspace=indent,eol,start

"Vim airline setting
let g:airline_theme="cool"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#branch#enabled = 1

" Creation hi with matching
autocmd FileType c match Identifier /ft_[a-z_]*/
autocmd FileType c 2match Type /[+=\-%\/<>*&]/
autocmd FileType c 3match Value /'[a-z,0-9 A-Z]'/

" Mapping appel fonction
nmap <F2> :call MakeFile()<CR><CR>
nmap <F3> :call C_compile()<CR><CR> :copen <CR>
nmap <F4> :call MainC()<CR><CR>
" mapping avec Tab pour changer de buffer
nmap <Tab> :bn<CR>
" mapping change viewport
nmap <S-Tab> <C-W><C-W>



" Custom indentPlugin Show
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
hi IndentGuidesOdd  ctermbg=238
hi IndentGuidesEven ctermbg=242
hi Error NONE
hi ErrorMsg NONE
nnoremap <space> za

" add man in vim cmd Man
runtime! ftplugin/man.vim


" autocompleted c
"setting lgne column 80
autocmd FileType c set colorcolumn=80
"color line 80 delimited
hi ColorColumn ctermbg=4

" auto completion langage C
autocmd FileType c inoremap { {<CR>}<C-o>O
autocmd FileType c inoremap ( ()<Left>
autocmd FileType c inoremap " ""<Left>
autocmd FileType c inoremap ' ''<Left>
autocmd FileType c inoremap : :<CR>
autocmd FileType c inoremap ; ;<CR>
autocmd FileType c inoremap [ []<Left>

" auto complede ifndef when *.h it's create
autocmd BufNewFile *.h  :call CheckHFile()

" ===============fonction================ 
"<F4> Auto write Main C
function! MainC()
    exe "normal!L"
    exe "normal!o"
    exe "normal!oint main(int argc, char **argv)"
    exe "normal!o{"
    exe "normal!o"
    exe "normal!oreturn (0);"
    exe "normal!o}"
endfunction

"Autocompilation File .h 
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

"fonction clear C file
function! Clear_C()
    execute "! rm -f Makefile"
    execute "! rm -f result_c"
    execute "! rm -f *.out"
endfunction

"<F3> fonction Compilation c > result_c
function! C_compile()
    execute ":make all"
    if filereadable('main.out')
        execute "! ./main.out > result_c"
    endif
endfunction

"<F2>fonction copy MakeFile to currently dir
function! MakeFile()
    let g:dir=getcwd()
    execute "! cp /Users/waxcoin/script_vim/Makefile ". g:dir
endfunction

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
let g:Powerline_symbols = 'fancy'
let cwd=getcwd()
let python_highlight_all=1
let g:SimpylFold_docstring_preview=1

"call vundle#begin('~/some/path/here')
call vundle#begin()

filetype plugin on
filetype indent on    " required

"====================================
" let Vundle manage Vundle, required=
"====================================
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'gerardbm/vim-atomic'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'makerj/vim-pdf'
" For install use 
"       :PluginIsntall
call vundle#end()            " required

" Airline_Vim
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
