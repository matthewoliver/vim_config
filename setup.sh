#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p ~/.vim/bundle/
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

cp $DIR/vimrc ~/.vimrc

mkdir -p ~/.fonts/
cd ~/.fonts/
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
cd -
fc-cache -vf ~/.fonts


mkdir -p ~/.fonts.conf.d/
cd ~/.fonts.conf.d/
wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
cd -
