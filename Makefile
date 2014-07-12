PATHOGEN_BUNDLE_DIR=$(HOME)/.vim/bundle
VIM_AUTOLOAD=$(HOME)/.vim/autoload

install:
	cp .vimrc $(HOME)/.vimrc
	cp -pr .vim $(HOME)

install-plugins: install
	echo "Installing Pathogen"
	mkdir -p $(VIM_AUTOLOAD)
	wget -O $(VIM_AUTOLOAD)/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
	./install-plugin.sh Tabular git://github.com/godlygeek/tabular.git $(PATHOGEN_BUNDLE_DIR)/tabular
	./install-plugin.sh NERDTree https://github.com/scrooloose/nerdtree.git $(PATHOGEN_BUNDLE_DIR)/nerd-tree
	./install-plugin.sh syntastic https://github.com/scrooloose/syntastic.git $(PATHOGEN_BUNDLE_DIR)/syntastic
	./install-plugin.sh nerdcommenter https://github.com/scrooloose/nerdcommenter.git $(PATHOGEN_BUNDLE_DIR)/nerd-commenter
	./install-plugin.sh fugitive https://github.com/tpope/vim-fugitive.git $(PATHOGEN_BUNDLE_DIR)/fugitive
	./install-plugin.sh airline https://github.com/bling/vim-airline $(PATHOGEN_BUNDLE_DIR)/airline

install-plugins-js: install-plugins
	./install-plugin.sh VimNode git://github.com/moll/vim-node.git $(PATHOGEN_BUNDLE_DIR)/node
	./install-plugin.sh JsSyntax git://github.com/jelera/vim-javascript-syntax.git $(PATHOGEN_BUNDLE_DIR)/vim-javascript-syntax
	./install-plugin.sh JsIndent git://github.com/vim-scripts/JavaScript-Indent.git $(PATHOGEN_BUNDLE_DIR)/vim-javascript-indent
