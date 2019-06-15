.PHONY: vim_upload 
.PHONY: vim_download
.PHONY: zsh_upload 
.PHONY: zsh_download
.PHONY: i3_upload
.PHONY: i3_download

all:
	echo Usage make [target]

vim_init:
	vim/install_plugin.sh

vim_upload: 
	cp ~/.vimrc vim/

vim_download:
	cp vim/.vimrc ~/

zsh_upload: 
	cp ~/.zshrc zsh/
	cp ~/.oh-my-zsh/themes/mybira.zsh-theme zsh/theme/

zsh_download:
	cp zsh/.zshrc ~/
	cp zsh/theme/* ~/.oh-my-zsh/themes/mybira.zsh-theme

i3_upload: 
	cp ~/.config/i3/* i3/

i3_download:
	cp i3/* ~/.config/i3/ 

polybar_upload: 
	cp ~/.config/polybar/* polybar/

polybar_download:
	cp polybar/* ~/.config/polybar/ 

ranger_upload: 
	cp ~/.config/ranger/* ranger/

ranger_download:
	cp ranger/* ~/.config/ranger/ 
