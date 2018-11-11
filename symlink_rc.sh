rm $HOME/.zshrc
rm $HOME/.vimrc
rm $HOME/.bashrc  

rm -rf $HOME/.vim
rm -rf $HOME/.config/powerline 

ln -s $HOME/.file/.vim $HOME/.vim
ln -s $HOME/.file/.zshrc $HOME/.zshrc
ln -s $HOME/.file/.vimrc $HOME/.vimrc
ln -s $HOME/.file/.bashrc $HOME/.bashrc
ln -s $HOME/.file/.config/powerline $HOME/.config/powerline 
