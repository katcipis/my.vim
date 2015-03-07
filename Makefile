all: install-plugins

install: 
	echo "Copying vimrc"
	cp vimrc $(HOME)/.vimrc
	rm -rf $(HOME)/.vim
	cp -pr vim $(HOME)/.vim

install-plugins: install
	echo "Installing Vundle"
	rm -rf $(HOME)/.vim/bundle 
	git clone https://github.com/gmarik/Vundle.vim.git $(HOME)/.vim/bundle/Vundle.vim 
	echo "Installing Plugins"
	vim +PluginInstall +qall
