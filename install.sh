#!/bin/sh

if [ -d ~/.config/nvim ]; then 
    echo "Deleting files to ~/.config/nvim"    
    rm -R ~/.config/nvim/
fi
if [ ! -d ~/.config/nvim ]; then 
    echo "Create directory ~/.config/nvim"
    mkdir -p ~/.config/nvim
fi
echo "Copy files from $(pwd)"
cp -r *.lua ~/.config/nvim/
cp -r lua ~/.config/nvim/
echo "Install completed!!!!"
