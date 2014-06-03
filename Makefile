#FIXME: WE HAVE A SEVERE DUPLICATION ON THIS MAKE !!!
# We need a function like:
#echo "Installing "$PLUGIN_NAME
#rm -rf $PLUGIN_INSTALL_DIR
#mkdir -p $PLUGIN_INSTALL_DIR
#git clone $PLUGIN_GIT_REPO $PLUGIN_INSTALL_DIR 

PATHOGEN_BUNDLE_DIR=$(HOME)/.vim/bundle

install:
	cp vimrc $(HOME)/.vimrc
	cp -pr .vim $(HOME)

install-plugins:
	echo "Installing Pathogen"
	mkdir -p $(HOME)/.vim/autoload
	mkdir -p $(PATHOGEN_BUNDLE_DIR) 
	wget -O $(HOME)/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
	echo "Installing Tabular"
	rm -rf $(PATHOGEN_BUNDLE_DIR)/tabular
	mkdir -p $(PATHOGEN_BUNDLE_DIR)/tabular
	git clone git://github.com/godlygeek/tabular.git $(PATHOGEN_BUNDLE_DIR)/tabular

install-js:
	echo "Installing Vim Node"
	rm -rf $(PATHOGEN_BUNDLE_DIR)/node
	mkdir -p $(PATHOGEN_BUNDLE_DIR)/node
	git clone git://github.com/moll/vim-node.git $(PATHOGEN_BUNDLE_DIR)/node
	echo "Installing Javascript Syntax"
	rm -rf $(PATHOGEN_BUNDLE_DIR)/vim-javascript-syntax
	mkdir -p $(PATHOGEN_BUNDLE_DIR)/vim-javascript-syntax
	git clone git://github.com/jelera/vim-javascript-syntax.git $(PATHOGEN_BUNDLE_DIR)/vim-javascript-syntax
	echo "Installing Javascript Indent"
	rm -rf $(PATHOGEN_BUNDLE_DIR)/vim-javascript-indent
	mkdir -p $(PATHOGEN_BUNDLE_DIR)/vim-javascript-indent
	git clone git://github.com/vim-scripts/JavaScript-Indent.git $(PATHOGEN_BUNDLE_DIR)/vim-javascript-indent
	echo "Installing Javascript Tern"
	rm -rf $(PATHOGEN_BUNDLE_DIR)/vim-javascript-tern
	mkdir -p $(PATHOGEN_BUNDLE_DIR)/vim-javascript-tern
	git clone git://github.com/marijnh/tern_for_vim.git $(PATHOGEN_BUNDLE_DIR)/vim-javascript-tern
	cd $(PATHOGEN_BUNDLE_DIR)/vim-javascript-tern; npm install
