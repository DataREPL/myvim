#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
NOW="$(date +'%Y%m%d%H%m%s')"

echo "Check if old vim config exists."
if [[  -d $HOME/.vim ]]; then
    mv $HOME/.vim $HOME/.vim.${NOW}
fi

if [[ -f $HOME/.vimrc ]]; then
    mv $HOME/.vimrc $HOME/.vimrc.${NOW}
fi

echo "Create symbol link to myvim."
ln -s ${DIR} $HOME/.vim
ln -s $HOME/.vim/vimrc $HOME/.vimrc
mkdir $HOME/.vim/undodir

echo "Install neobundle"
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

echo "Install plugins via neobundle"
vim +NeoBundleInstall +qall

echo "Build YouCompleteMe."
bash ${DIR}/build_ycm.sh

echo "All done. Please check the log and do further steps."
