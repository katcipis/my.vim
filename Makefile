install-vimrc:
	cp vimrc $(HOME)/.vimrc

install: install-vimrc
	rm -rf $(HOME)/.vim
	cp -pr vim $(HOME)/.vim
	echo "Installing Vundle"
	rm -rf $(HOME)/.vim/bundle
	git clone https://github.com/gmarik/Vundle.vim.git $(HOME)/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
