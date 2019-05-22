.PHONY: vim_upload 
.PHONY: vim_download

all:
	echo Usage make [target]

vim_upload: 
	cp ~/.vimrc vim/

vim_download:
	cp vim/.vimrc ~/

zsh_upload: 
	cp ~/.zshrc zsh/

zsh_download:
	cp zsh/.zshrc ~/


