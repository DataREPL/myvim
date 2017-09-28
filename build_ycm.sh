#!
#!/bin/bash

cd ~/.vim/bundle/YouCompleteMe/
git submodule update --init --recursive
./install.py --all
