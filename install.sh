echo "Copying vimrc"
cp vimrc $HOME/.vimrc
rm -rf $HOME/.vim
cp -pr vim $HOME/.vim
echo "Installing Vundle"
rm -rf $HOME/.vim/bundle 
git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim 
echo "Installing Plugins"
vim +PluginInstall +qall
echo "Workaround for the vim-scala plugin" #https://github.com/derekwyatt/vim-scala/issues/75
mkdir -p ~/.vim/ftdetect 
cp $HOME/.vim/bundle/vim-scala/ftdetect/scala.vim $HOME/.vim/ftdetect
