rm $HOME/.zshrc
rm $HOME/.vimrc
rm $HOME/.bashrc

rm -rf $HOME/.vim

ln -s $HOME/.file/.vim $HOME/.vim
ln -s $HOME/.file/.zshrc $HOME/.zshrc
ln -s $HOME/.file/.vimrc $HOME/.vimrc
ln -s $HOME/.file/.bashrc $HOME/.bashrc
