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

vim_link:
	ln -sf ~/setup/dotfiles/vim/.vimrc ~/

nvim_link:
	mkdir ~/.config/nvim
	ln -s ~/.vimrc ~/.config/nvim/init.vim

zsh_upload: 
	cp ~/.zshrc zsh/
	cp ~/.oh-my-zsh/themes/mybira.zsh-theme zsh/theme/

zsh_download:
	cp zsh/.zshrc ~/
	cp zsh/theme/* ~/.oh-my-zsh/themes/mybira.zsh-theme

zsh_link:
	ln -sf ~/setup/dotfiles/zsh/.myzshrc ~/.zshrc

i3_upload: 
	cp ~/.config/i3/* i3/

i3_download:
	cp i3/* ~/.config/i3/ 

i3_link:
	ln -sf ~/setup/dotfiles/i3 ~/.config/i3
	ln -sf ~/setup/dotfiles/i3/.xinitrc ~/

polybar_upload: 
	cp ~/.config/polybar/* polybar/

polybar_download:
	cp polybar/* ~/.config/polybar/ 

polybar_link:
	ln -sf ~/setup/dotfiles/polybar ~/.config/polybar

ranger_upload: 
	cp ~/.config/ranger/* ranger/

ranger_download:
	cp ranger/* ~/.config/ranger/ 

ranger_link:
	ln -sf ~/setup/dotfiles/ranger ~/.config

ranger_download_old:
	cp ranger/rc-1.8.conf ~/.config/ranger/rc.conf

tmux_download:
	cp tmux/.tmux.conf ~/

tmux_upload:
	cp ~/.tmux.conf tmux/.tmux.conf

tmux_link:
	ln -sf ~/setup/dotfiles/tmux/.tmux.conf ~/

urxvt_link:
	ln -sf ~/setup/dotfiles/.Xresources ~/

gtk_link:
	ln -sf ~/setup/dotfiles/gtk/settings.ini /etc/gtk-3.0/settings.ini
	ln -sf ~/setup/dotfiles/gtk/settings.ini /etc/gtk-2.0/gtkrc
