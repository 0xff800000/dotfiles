.PHONY: vim_upload 
.PHONY: vim_download
.PHONY: zsh_upload 
.PHONY: zsh_download
.PHONY: i3_upload
.PHONY: i3_download

all:
	echo Usage make [target]

vim_init:
	./vim/install_plguin.sh

vim_upload: 
	cp ~/.vimrc vim/

vim_download:
	cp vim/.vimrc ~/

zsh_upload: 
	cp ~/.zshrc zsh/

zsh_download:
	cp zsh/.zshrc ~/

i3_upload: 
	cp ~/.config/i3/* i3/

i3_download:
	cp i3/ ~/.config/i3/* 
