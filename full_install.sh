#! /bin/bash

#code color
Cyan='\033[1;36m'
Red='\033[0;31m'
Color_Off='\033[0m'

installNerdFont()
{
	echo "Copy font "
	cp ~/Custom-Zsh/font/* $HOME/Library/Fonts 
}

settingFont()
{
	echo -e "$Cyan Open setting Profil/text/font \nchoose Meslo LG LD nerd font$Color_Off"
	echo "Setting finish?"
	read var
	echo "$Cyan Changer color Profil/Colors/Color Preset/import\n/custome_Zsh/Wax_Iterm.itercolors$Color_Off"
	echo "Setting finsih?"
	read var
}

installPowerline()
{
	git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
}

configZshrc()
{
	echo "Copy .zshrc"
	cp ~/Custom-Zsh/zshrc ~/.zshrc
}

configVimrc()
{
	echo "Copy .vimrc"
	cp ~/Custom-Zsh/vimrc ~/.vimrc	
}

installVumble()
{
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	echo "$Cyan open new page vim use :PluginInstall $Color_Off"
	echo "Setting finish?"
	read var
}

installColorVim()
{
	echo "Copy Color airline vim"
	cp ~/Custom-Zsh/cool.vim ~/.vim/bundle/vim-airline-themes/autoload/airline/themes
	echo "Copy Color vim"
	mkdir ~/.vim/Colors
	cp ~/Custom-Zsh/wax.vim ~/.vim/Colors
}

installScriptVim()
{
    echo "Copy Script for vim"
    mkdir ~/script_vim
    cp ~/Custom-Zsh/Makefile ~/script_vim/.
    cp ~/Custom-Zsh/c_script.sh ~/script_vim/.
    cp ~/Custom-Zsh/check ~/script_vim/.
}

installNerdFont
settingFont
installPowerline
configZshrc
configVimrc
installVumble
installColorVim
installScriptVim
