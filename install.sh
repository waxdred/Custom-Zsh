#! /bin/bash

#code color
Cyan='\033[1;36m'
Red='\033[0;31m'
Color_Off='\033[0m'
file=~/.oh-my-zsh
installZsh()
{
    if [ -f "$file" ]
    then
        echo "Install Zsh"
    else
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        echo "use ./install.sh"
    fi
}

installNerdFont()
{
	echo "Copy font "
	cp ~/Custom-Zsh/font/* ~/Library/Fonts 
}

settingFont()
{
	echo -e "$Cyan Open setting Profil/Colors/Color Presets../import\nChoose file ~/Custom-Zsh/ColorCyan.itermcolors $Color_Off"
	echo "Setting finish?"
	read var
    	echo -e "$Cyan Open setting Profil/Text/Font\nChoose MesloLGLDZ Nerd Font$Color_Off"
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
	cp ~/Custom-Zsh/zshrc  ~/.zshrc
}

configVimrc()
{
	echo "Copy .vimrc"
	cp ~/Custom-Zsh/vimrc ~/.vimrc	
}

installVumble()
{
    echo "install Plugin vim:"
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim -E +PluginInstall +qall
    echo "done!"
}

installColorVim()
{
	echo "Copy Color airline vim"
	cp ~/Custom-Zsh/cool.vim ~/.vim/bundle/vim-airline-themes/autoload/airline/themes
	echo "Copy Color vim"
	mkdir ~/.vim/Colors
	cp ~/Custom-Zsh/ColorCyan.vim ~/.vim/Colors
    cp ~/Custom-Zsh/com.googlecode.iterm2.plist ~/Library/Preferences/.
}

installScriptVim()
{
    echo "Copy Script for vim"
    mkdir ~/script_vim
    cp ~/Custom-Zsh/Makefile ~/script_vim/.
    cp ~/Custom-Zsh/c_script.sh ~/script_vim/.
    cp ~/Custom-Zsh/check ~/script_vim/.
}

installZsh
installNerdFont
settingFont
installPowerline
configZshrc
configVimrc
installVumble
installColorVim
installScriptVim
echo -e "$Cyan Well done! reboot your terminal"
