
Attention the script change your .vimrc and .zshrc save yours before 
Installation thême powerline custom Cyan:
git clone https://github.com/waxdred/Custom-Zsh.git

`<addr>`./install.sh

follow the instruction

screenshot theme

![GitHub Logo](/logo/powerlineShell.png)
Format: ![Alt Text](url)

![GitHub Logo](/logo/powerlineVim.png)
Format: ![Alt Text](url)

Manuall installation

Add font:
cp ~/Custom-Zsh/font/ * $HOME/Library/Fonts

install powerlevel9k:
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

add Vumble if not install:
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

add in the .vimrc plugin
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'gerardbm/vim-atomic'
Plugin 'nathanaelkane/vim-indent-guides'

save and run vi again 
:PluginInstall

after add in .vimrc

"Vim airline setting
let g:airline_theme="cool"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#branch#enabled = 1

colo ColorCyan
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

add Color powerline:
cp ~/Custom-Zsh/cool.vim ~/.vim/bundle/vim-airline-themes/autoload/airline/themes

add Color vim:
cp ~/Custom-Zsh/ColorCyan.vim ~/.vim/Colors

Go on setting Iterm2 Profiles/Colors/Color Presets/Import:
add Custom-Zsh/ColorCyan.itermcolors

go on text and change font
add MesloLGLDZ Nerd font


