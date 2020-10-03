export EDITOR=vim
alias vi="vim"
alias ls="ls --color=auto"
alias l="ls"
alias ll="ls -la"
alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias tmuxconfig="vi ~/.tmux.conf"
alias tmuxreload="tmux source-file ~/.tmux.conf"
alias zshconfig="vi ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias zshalias="vi ~/setup/dotfiles/zsh/zsh_alias.zsh"
alias vimconfig="vi ~/.vimrc"
alias i3config="vi ~/.config/i3/config"
alias polybarconfig="vi ~/.config/polybar/config"
alias changebg="feh --randomize --bg-fill ~/Pictures/wallpaper/*"

# WSL open file
alias wsls="powershell.exe Start "

# git
alias gs="git status"

# dotfiles
alias dots="cd ~/setup/dotfiles"

