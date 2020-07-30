#! /bin/bash

installScriptVim()
{
    echo "Copy Script for vim"
    mkdir ~/script_vim
    cp ~/Custom-Zsh/Makefile ~/script_vim/.
    cp ~/Custom-Zsh/c_script.sh ~/script_vim/.
    cp ~/Custom-Zsh/check ~/script_vim/.
}

installScriptVim

