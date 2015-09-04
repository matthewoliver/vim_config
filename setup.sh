#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Get Vundle, the vim bundler
mkdir -p ~/.vim/bundle/
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Put our vimrc in place
cp $DIR/vimrc ~/.vimrc

# Set up fonts
mkdir -p ~/.fonts/
cd ~/.fonts/
# Hack font
wget https://github.com/chrissimpkins/Hack/releases/download/\
v2.010/Hack-v2_010-otf.zip -O hack.zip
unzip -u hack.zip && rm -f hack.zip
cd -

# Update fonts
fc-cache -vf ~/.fonts

# Install all the bundles specified in .vimrc
vim +BundleInstall +qall
