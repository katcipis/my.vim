PATHOGEN_BUNDLE_DIR=$(HOME)/.vim/bundle
VIM_AUTOLOAD=$(HOME)/.vim/autoload

install:
	cp .vimrc $(HOME)/.vimrc
	cp -pr .vim $(HOME)

install-plugins:
	echo "Installing Pathogen"
	mkdir -p $(VIM_AUTOLOAD)
	wget -O $(VIM_AUTOLOAD)/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
	./install-plugin.sh Tabular git://github.com/godlygeek/tabular.git $(PATHOGEN_BUNDLE_DIR)/tabular

install-js:
	./install-plugin.sh VimNode git://github.com/moll/vim-node.git $(PATHOGEN_BUNDLE_DIR)/node
	./install-plugin.sh JsSyntax git://github.com/jelera/vim-javascript-syntax.git $(PATHOGEN_BUNDLE_DIR)/vim-javascript-syntax
	./install-plugin.sh JsIndent git://github.com/vim-scripts/JavaScript-Indent.git $(PATHOGEN_BUNDLE_DIR)/vim-javascript-indent
	./install-plugin.sh JsTern git://github.com/marijnh/tern_for_vim.git $(PATHOGEN_BUNDLE_DIR)/vim-javascript-tern
