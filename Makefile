install:
	cp .vimrc $(HOME)/.vimrc
	cp -pr .vim $(HOME)
	echo "Installing Vundle"
	rm -rf $(HOME)/.vim/bundle
	git clone https://github.com/gmarik/Vundle.vim.git $(HOME)/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
