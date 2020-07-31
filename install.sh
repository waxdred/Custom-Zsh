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
	echo -e "$Cyan Open setting Profil/Other action/import JSon Profil $Color_Off"
	echo "Setting finish?"
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
	echo -e "$Cyan open new page vim use :PluginInstall$Color_Off"
	echo "Setting finish?"
	read var
}

installColorVim()
{
	echo "Copy Color airline vim"
	cp ~/Custom-Zsh/cool.vim ~/.vim/bundle/vim-airline-themes/autoload/airline/themes
	echo "Copy Color vim"
	mkdir ~/.vim/Colors
	cp ~/Custom-Zsh/ColorCyan.vim ~/.vim/Colors
}

installScriptVim()
{
    echo "Copy Script for vim"
    mkdir ~/script_vim
    cp ~/Custom-Zsh/Makefile ~/script_vim/.
    cp ~/Custom-Zsh/c_script.sh ~/script_vim/.
    cp ~/Custom-Zsh/check ~/script_vim/.
}
echo -e "$Cyan         Well done! Reboot your terminal$Color_Off"

echo "Welcome choose an option"
echo "1) new configuration"
echo "2) add theme on configuration"
read var

if [ $var -eq 1 ]
then
    echo "Attention this option create new vimrc and zshrc\nStill want continue Y / N"
    read var
    if [ "$var" = "y" ]
    then
        installNerdFont
        settingFont
        installPowerline
        configZshrc
        configVimrc
        installVumble
        installColorVim
        installScriptVim
        echo -e "$Cyan Well done! reboot your terminal"
    else
        echo "Follow the readme =)"
    fi
else
    echo "Follow the readme =)"
fi
