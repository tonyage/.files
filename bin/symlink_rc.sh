rm $HOME/.zshrc
rm $HOME/.vimrc
rm $HOME/.bashrc  
rm $HOME/.tmux.conf 
rm $HOME/.ideavimrc
rm $HOME/.config/nvim 

rm -rf $HOME/.vim
rm -rf $HOME/.config/powerline 

ln -s $HOME/.file/.vim $HOME/.vim
ln -s $HOME/.file/.vim $HOME/.config/nvim
ln -s $HOME/.file/.zshrc $HOME/.zshrc
ln -s $HOME/.file/.vimrc $HOME/.vimrc
ln -s $HOME/.file/.bashrc $HOME/.bashrc
ln -s $HOME/.file/.ideavimrc $HOME/.ideavimrc
ln -s $HOME/.file/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/.file/.config/powerline $HOME/.config/powerline
ln -s $HOME/.file/.vim $HOME/.config/nvim
ln -s $HOME/.file/.gitconfig $HOME/.gitconfig
