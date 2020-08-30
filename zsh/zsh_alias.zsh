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
alias vimconfig="vi ~/.vimrc"
alias i3config="vi ~/.config/i3/config"
alias polybarconfig="vi ~/.config/polybar/config"
alias changebg="feh --randomize --bg-fill ~/Pictures/wallpaper/*"
# Git log override pretty graph
git() {
    if [[ $@ == "log" ]]; then
        command git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all
    else
        command git "$@"
    fi
}
